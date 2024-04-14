from pathlib import Path
import os
from argparse import ArgumentParser, Namespace

DIR = os.path.dirname(__file__)

class SymlinkCreateConfig(Namespace):
    force : bool
    dotfile_dir: str
    config_dir : str

def parse_args():
    parser = ArgumentParser('Symlink Creation for Dotfiles')
    parser.add_argument('-f', '--force', action='store_true', help='Force creation of dotfiles, will replace current dotfiles completely. (default = False)')
    parser.add_argument('-d', '--dotfile_dir', action='store', type=str, default=os.environ.get('HOME'), help='Where to place files in dotfile directory. (default = ~ )')
    parser.add_argument('-c', '--config_dir', action='store', type=str, default=os.environ.get('XDG_CONFIG_HOME', os.environ.get('HOME', '~')+'/.config'), help='Where to place directories in config directory. (default = $XDG_CONFIG_HOME or $HOME/.config if not set )')
    

    args = parser.parse_args(namespace=SymlinkCreateConfig)
    args.dotfile_dir = str(Path(args.dotfile_dir).resolve())
    args.config_dir = str(Path(args.config_dir).resolve())
    return args


def create_symlink(source, destination, force):
    if verify_symlink_creation(destination) or force:
        os.symlink(source, destination)
        print(f'linked {source} to {destination}')
    else:
        print(f'Skipping link from {source} to {destination}') 


def user_verified_create(destination: str):
    answer = ''
    while answer not in ['y', 'yes', 'n', 'no']:
        answer = input(f'Create symlink for {destination}? Current files will be overwritten: [Y]es/[N]o ').lower()
    
    return answer in ['yes', 'y']


def verify_symlink_creation(destination: str):
    if not os.path.exists(destination):
        return True
    if user_verified_create(destination):
        return True
    return False

def main():
    args = parse_args()
    for source_dir in ['config', 'dots']:
        destination_dir = args.config_dir if source_dir == 'config' else args.dotfile_dir
        source_dir = Path(DIR) / source_dir
        destination_dir = Path(destination_dir)

        for directory in os.listdir(source_dir):
            create_symlink(str(source_dir / directory), str(destination_dir / directory), args.force)

if __name__ == '__main__':
    main()
