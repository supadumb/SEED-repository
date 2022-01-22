#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/netfilter.h>
#include <linux/netfilter_ipv4.h>
#include <linux/ip.h>
#include <linux/tcp.h>
#include <linux/icmp.h>
#include <linux/inet.h>

/* static struct nf_hook_ops telnetFilterHook; */

unsigned int generic_hook(void *priv, struct sk_buff *skb, const struct nf_hook_state *state)
{
  struct iphdr *iph;
  struct tcphdr *tcph;
  struct icmphdr *icmph;
  iph = ip_hdr(skb);
  tcph = (void *)iph+iph->ihl*4;

  if (iph->protocol == IPPROTO_ICMP){
  	icmph = (struct icmphdr *)((__u32 *)iph + iph->ihl);
	if(icmph->type == 8 && icmph->code == 0 && iph->saddr == in_aton("192.168.148.140")){
		printk(KERN_INFO "Block icmp to %d.%d.%d.%d\n",
		    ((unsigned char *)&iph->daddr)[0],
		    ((unsigned char *)&iph->daddr)[1],
		    ((unsigned char *)&iph->daddr)[2],
		    ((unsigned char *)&iph->daddr)[3]);
		return NF_DROP;
	}
  } 
      /* if no rules are matched */
      return NF_ACCEPT;
}

// register for all hooks
static struct nf_hook_ops my_hooks[] = {
    {
        .hook   = generic_hook,
        .pf     = NFPROTO_IPV4,
        .hooknum    = NF_INET_PRE_ROUTING,
        .priority   = NF_IP_PRI_LAST,
    },
    {
        .hook   = generic_hook,
        .pf     = NFPROTO_IPV4,
        .hooknum    = NF_INET_LOCAL_IN,
        .priority   = NF_IP_PRI_LAST,
    },
    {
        .hook   = generic_hook,
        .pf     = NFPROTO_IPV4,
        .hooknum    = NF_INET_FORWARD,
        .priority   = NF_IP_PRI_LAST,
    },
    {
        .hook   = generic_hook,
        .pf     = NFPROTO_IPV4,
        .hooknum    = NF_INET_LOCAL_OUT,
        .priority   = NF_IP_PRI_LAST,
    },
    {
        .hook   = generic_hook,
        .pf     = NFPROTO_IPV4,
        .hooknum    = NF_INET_POST_ROUTING,
        .priority   = NF_IP_PRI_LAST,
    },
};


int setUpFilter(void) {
        printk(KERN_INFO "Registering a new filter.\n");
        /* telnetFilterHook.hook     = telnetFilter; */
        /* telnetFilterHook.hooknum  = NF_INET_POST_ROUTING; */
        /* telnetFilterHook.pf       = PF_INET; */
        /* telnetFilterHook.priority = NF_IP_PRI_FIRST; */

        // Register the hook.
        nf_register_hooks(my_hooks, ARRAY_SIZE(my_hooks));
        return 0;
}

void removeFilter(void) {
        printk(KERN_INFO "Filter is being removed.\n");
        nf_unregister_hooks(my_hooks, ARRAY_SIZE(my_hooks));
}

module_init(setUpFilter);
module_exit(removeFilter);

MODULE_LICENSE("GPL");