Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 6ACC2529D2
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 17:16:44 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0J001IW9BLJQ70@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 05 Feb 2014 11:16:34 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B417B202AA; Wed,
	05 Feb 2014 12:16:32 -0500 (EST)
Date: Wed, 05 Feb 2014 12:16:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Message-id: <20140205171632.GB22890@denix.org>
References: <1391618251-27247-1-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1391618251-27247-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] base-files: pre-create /run symlink to point to /var/run
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
X-List-Received-Date: Wed, 05 Feb 2014 17:16:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Please ignore some old duplicate patches appearing on the list, while I'm 
testing my setup...

On Wed, Feb 05, 2014 at 11:37:31AM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Make it available on the first boot too, otherwise the first boot may fail
> to automount SD card partitions. Normally, it gets created on the first
> boot by volatiles init script and stays there on consecutive boots.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/base-files/base-files_3.0.14.bbappend        | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
> index c0ab069..4d831fd 100644
> --- a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
> +++ b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
> @@ -1,4 +1,13 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago0"
> +PR_append = "-arago1"
> +
> +# Pre-create /run symlink to point to /var/run at build time
> +# This normally happens on first boot, but may be too late for automount,
> +# which tries to create mount-points in /run
> +# NOTE: This step is not required in Dora and up, due to reverse direction
> +# of symlinking between /run and /var/run
> +do_install_append () {
> +	ln -sf /var/run ${D}/run
> +}
> -- 
> 1.8.3.2
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

