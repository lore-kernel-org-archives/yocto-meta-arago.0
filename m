Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 769A05298F
	for <meta-arago@arago-project.org>;
	Thu,  9 Aug 2012 22:09:33 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M8I00D48DIOBSQW@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 09 Aug 2012 17:09:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 70B4420264; Thu,
	09 Aug 2012 18:08:48 -0400 (EDT)
Date: Thu, 09 Aug 2012 18:08:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20120809220848.GA9728@denix.org>
References: <1344462645-2945-1-git-send-email-fcooper@ti.com>
	<1344462645-2945-2-git-send-email-fcooper@ti.com>
	<2fc6fdb7-a8a9-4517-8ec5-7cb4c245a6fa@email.android.com>
	<A4B6DC62-4FF5-4F92-B4C7-480EDDCD8B8C@ti.com>
MIME-version: 1.0
In-reply-to: <A4B6DC62-4FF5-4F92-B4C7-480EDDCD8B8C@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [branches:master][PATCH 2/2 v3] busybox: Enable vlan, tftpd, udpsvd, tcpsvd and inetd
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2012 22:09:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Aug 09, 2012 at 04:37:19AM +0000, Cooper Jr., Franklin wrote:
> How do you differentiate between what goes in distro  and what goes in 
> extras? Based off of my understanding of what should go where the extras 
> layer would be the best fit.

Franklin,

The rationale is that this kind of changes are rather distro-specific - 
customizations, configurations, options, versions etc.

What goes into extras is anything that can be used by others and is not 
necessary Arago-specific. That would be mostly TI-made apps.

Denys


> On Aug 8, 2012, at 11:23 PM, "Denys Dmytriyenko" <denis@denix.org<mailto:denis@denix.org>> wrote:
> 
> A quick comment - these should go to meta-arago-distro and not extras.
> 
> Denys
> 
> 
> Franklin S Cooper Jr <fcooper@ti.com<mailto:fcooper@ti.com>> wrote:
> 
> * Enable vconfig which is useful for devices that support the virtual
>   lan kernel option such as the am335x
> 
> * Enable tftpd ,udpsvd and tcpsvd
> 
> * Enable inetd service which is used by various programs including tftpd
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com<mailto:fcooper@ti.com>>
> ---
>  .../recipes-core/busybox/busybox/defconfig         |   20 ++++++++++----------
>  1 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/busybox/busybox/defconfig b/meta-arago-extras/recipes-core/busybox/busybox/defconfig
> index 372d7b5..4aa0e7e 100644
> --- a/meta-arago-extras/recipes-core/busybox/busybox/defconfig
> +++ b/meta-arago-extras/recipes-core/busybox/busybox/defconfig
> @@ -774,12 +774,12 @@ CONFIG_FEATURE_IFUPDOWN_IPV4=y
>  CONFIG_FEATURE_IFUPDOWN_IPV6=y
>  CONFIG_FEATURE_IFUPDOWN_MAPPING=
>  y
> 
> # CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
> -# CONFIG_INETD is not set
> -# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
> -# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
> -# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
> -# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
> -# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
> +CONFIG_INETD=y
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO=y
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD=y
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=y
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME=y
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN=y
>  # CONFIG_FEATURE_INETD_RPC is not set
>  CONFIG_IP=y
>  CONFIG_FEATURE_IP_ADDRESS=y
> @@ -806,7 +806,7 @@ CONFIG_NSLOOKUP=y
>  # CONFIG_PSCAN is not set
>  CONFIG_ROUTE=y
>  # CONFIG_SLATTACH is not set
> -# CONFIG_TCPSVD is not set
> +CONFIG_TCPSVD=y
>  CONFIG_TELNET=y
>  #
> CONFIG_FEATURE_TELNET_TTYPE is not set
>  CONFIG_FEATURE_TELNET_AUTOLOGIN=y
> @@ -814,7 +814,7 @@ CONFIG_FEATURE_TELNET_AUTOLOGIN=y
>  # CONFIG_FEATURE_TELNETD_STANDALONE is not set
>  # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
>  CONFIG_TFTP=y
> -# CONFIG_TFTPD is not set
> +CONFIG_TFTPD=y
> 
>  #
>  # Common options for tftp/tftpd
> @@ -846,8 +846,8 @@ CONFIG_UDHCP_DEBUG=0
>  CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
>  CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
>  CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
> -# CONFIG_UDPSVD is not set
> -# CONFIG_VCONFIG is not set
> +CONFIG_UDPSVD=y
> +CONFIG_VCONFIG=y
>  CONFIG_WGET=y
>  CONFIG_FEATURE_WGET_STATUSBAR=y
>  CONFIG_FEATURE_WGET_AUTHENTICATION=y
> --
> 1.7.0.4<http://1.7.0.4>
> 
> ________________________________
> 
> meta-arago mailing list
> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

