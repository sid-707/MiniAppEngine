import { deploy } from './commands';

describe('commands', () => {
    describe('deploy', () => {
        it('logs the correct deployment message', () => {
          // Mock console.log
          const logSpy = jest.spyOn(console, 'log');
      
          // The directory to be deployed
          const appDirectory = 'path/to/app';
      
          // Call the deploy function
          deploy(appDirectory);
      
          // Check that console.log was called with the correct message
          expect(logSpy).toHaveBeenCalledWith('Deploying application from: ', appDirectory);
      
          // Restore the original console.log
          logSpy.mockRestore();
        });
      });  
})