import pytest
from main import app
from unittest.mock import patch

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

@pytest.fixture
def mock_sleep():
    with patch('time.sleep', return_value=None) as mock:
        yield mock

@pytest.mark.parametrize("delay_value", [
    (3),
    (5),
    (10)
])
def test_delay_response_status_code(client, delay_value, mock_sleep):
    response = client.get('/delay?delay={delay_value}')
    assert response.status_code == 200

@pytest.mark.parametrize("delay_value", [
    (3),
    (5),
    (10)
])
def test_delay_calls_time_sleep(client, delay_value, mock_sleep):
    response = client.get(f'/delay?delay={delay_value}')
    mock_sleep.assert_called_once_with(delay_value)

@pytest.mark.parametrize("delay_value,expected_response", [
    (3, b'Response after 3 seconds delay'),
    (5, b'Response after 5 seconds delay'),
    (10, b'Response after 10 seconds delay'),
])
def test_delay_response_message(client, delay_value, expected_response, mock_sleep):
    response = client.get(f'/delay?delay={delay_value}')
    assert expected_response in response.data