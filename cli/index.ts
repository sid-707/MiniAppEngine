import { Command } from "commander";
import { handleCommand } from "./commandHandler";

const program = new Command();

// Write tests
program.version('0.0.1')
.description('A CLI for managing applications on MiniAppEngine');

program.command('deploy <app-directory>')
.description('Deploy an application')
.action((appDirectory) => handleCommand('deploy', appDirectory))

program.parse(process.argv);