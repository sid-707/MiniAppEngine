import { deploy } from './commands';
import { handleCommand } from './commandHandler';
jest.mock('./commands', () => ({
  deploy: jest.fn(),
}));

describe('Command Handler Tests', () => {
  it('should call deploy when deploy command is invoked', () => {
    handleCommand('deploy', 'test-directory');
    expect(deploy).toHaveBeenCalledWith('test-directory');
  });
});