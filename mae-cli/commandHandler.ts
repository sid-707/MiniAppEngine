import { deploy } from './commands';

export const handleCommand = (commandName: string, args: string) => {
  switch (commandName) {
    case 'deploy':
      return deploy(args);
    default:
      throw new Error('Unknown command');
  }
};