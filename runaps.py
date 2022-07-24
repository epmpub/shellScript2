
from multiprocessing import Pool, Process
from time import sleep

import os

def run_proc(name):
    # operator momic
    n = 1
    while True:
        sleep(2)
        print("%s ,%s..."%(name,os.getpid()))
        n += 1
 
# if __name__=='__main__':
#     print('Parent process %s.' % os.getpid())
#     p = Process(target=run_proc, args=('test',))
#     print('Child process will start.')
#     p.start()
#     p.join()
#     print('Child process end.')

if __name__=='__main__':
    print('Parent process %s.' % os.getpid())
    p = Pool(10)
    for i in range(20):
        p.apply_async(run_proc, args=(i,))
    print('Waiting for all subprocesses done...')
    p.close()
    p.join()
    print('All subprocesses done.')
    