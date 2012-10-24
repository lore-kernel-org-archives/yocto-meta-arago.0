Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 080F15209D
	for <meta-arago@arago-project.org>;
	Wed, 24 Oct 2012 20:00:16 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCE008N3Y8DYK30@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 24 Oct 2012 15:00:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5DA492038D; Wed,
	24 Oct 2012 16:00:12 -0400 (EDT)
Date: Wed, 24 Oct 2012 16:00:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20121024200012.GB3465@denix.org>
References: <1350942384-27039-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1350942384-27039-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/2] remove-net-rules: Add a class to remove net rules from images
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
X-List-Received-Date: Wed, 24 Oct 2012 20:00:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Oct 22, 2012 at 04:46:23PM -0500, Chase Maupin wrote:
> * Inherit the remove-net-rules class in the TISDK images to remove
>   the utility that creates the persistent net rules file.
> * This allows moving SD cards between EVMs.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta-arago-distro/classes/remove-net-rules.bbclass |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/classes/remove-net-rules.bbclass
> 
> diff --git a/meta-arago-distro/classes/remove-net-rules.bbclass b/meta-arago-distro/classes/remove-net-rules.bbclass
> new file mode 100644
> index 0000000..3227221
> --- /dev/null
> +++ b/meta-arago-distro/classes/remove-net-rules.bbclass
> @@ -0,0 +1,15 @@
> +# Add a ROOTFS_POSTPROCESS_COMMAND that will strip the write_net_rules
> +# executable from the file system.  This will prevent the
> +# 70-persistent-net.rules from being created.  Not having this file
> +# will allow moving SD cards between EVMs and similar boards such as
> +# beaglebone and the EVM.
> +
> +ROOTFS_POSTPROCESS_COMMAND += "rootfs_remove_net_rules"

ROOTFS_POSTPROCESS_COMMAND is a list of shell commands/functions - you need to 
terminate it with a semicolon, i.e. R_P_C += "func;"

> +
> +rootfs_remove_net_rules () {
> +    if [ -e ${IMAGE_ROOTFS}/lib/udev/write_net_rules ]
> +    then
> +        rm ${IMAGE_ROOTFS}/lib/udev/write_net_rules
> +    fi
> +}
> +
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

