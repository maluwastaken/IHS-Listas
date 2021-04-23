#include <linux/init.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
MODULE_LICENSE("Dual BSD/GPL");
static int a = 9999;
module_param(a, int, 0);

static int __init hello_init(void)
{
    printk(KERN_INFO "Hello, new Worlds\n");
    return 0;
}

static void __exit hello_exit(void)
{
    printk(KERN_INFO "Bye, %d Worlds\n", a);
}

module_init(hello_init);
module_exit(hello_exit);