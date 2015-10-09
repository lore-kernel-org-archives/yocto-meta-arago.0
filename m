Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 66AFA52A58
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 11:36:54 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NVY0069OAWI2XF0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 09 Oct 2015 06:36:38 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=kj9zAlcOel0A:10 a=5lJygRwiOn0A:10
	a=sozttTNsAAAA:8 a=HihYlcsHAAAA:8	a=tDg2ZpK3bvcYUoiBNIIA:9
	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2AB85161C70; Fri,
	9 Oct 2015 07:36:18 -0400 (EDT)
Date: Fri, 09 Oct 2015 07:36:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-id: <20151009113618.GE11709@denix.org>
References: <1444390383-5586-1-git-send-email-j-stiffler@ti.com>
MIME-version: 1.0
In-reply-to: <1444390383-5586-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] init-ifupdown: Fix getting DNS if rootfs is network mount
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
X-List-Received-Date: Fri, 09 Oct 2015 11:36:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

NAK, this is wrong.

On Fri, Oct 09, 2015 at 07:33:03AM -0400, Jacob Stiffler wrote:
> * Previously, if the rootfs was a network mount, then no network
>   configuration was done
> * This included the DHCP request to obtain the DNS addresses
> * If the rootfs is a network mount, then run "udhcpc" to get the DNS
>   addresses
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init      | 5 ++++-
>  .../recipes-core/init-ifupdown/init-ifupdown_%.bbappend              | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
> index 86aff88..235652d 100644
> --- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
> +++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
> @@ -20,12 +20,15 @@ case "$1" in
>          if sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts | 
>            grep -q "^/ nfs$"; then
>              echo "NOT configuring network interfaces: / is an NFS mount"
> +            udhcpc
>          elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts |  
>            grep -q "^/ smbfs$"; then
>              echo "NOT configuring network interfaces: / is an SMB mount"
> -	elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\2/p' /proc/mounts | 
> +            udhcpc
> +        elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\2/p' /proc/mounts | 
>            grep -qE '^(nfs|smbfs|ncp|coda)$'; then
>              echo "NOT configuring network interfaces: network shares still mounted."
> +            udhcpc
>          else
>              echo -n "Configuring network interfaces... "
>              ifup -a
> diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
> index c0ab069..997adf2 100644
> --- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
> +++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
> @@ -1,4 +1,4 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago0"
> +PR_append = "-arago1"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

