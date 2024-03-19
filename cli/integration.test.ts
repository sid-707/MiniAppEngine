const { spawn } = require('child_process');

describe('CLI Integration Tests', () => {
  it('should call deploy with the correct argument', (done) => {
    const deployCLI = spawn('node', ['index.js', 'deploy', 'example-directory']);

    deployCLI.stdout.on('data', (data) => {
      expect(data.toString()).toContain('Deploying application from: example-directory');
      done();
    });

    deployCLI.stderr.on('data', (data) => {
      done(data.toString());
    });
  });
});