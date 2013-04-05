Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTP id AC97D52AAA
	for <meta-arago@arago-project.org>;
	Fri,  5 Apr 2013 23:57:07 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MKT00EZN3V1BE60@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 05 Apr 2013 18:57:07 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BC34F201C2; Fri,
	05 Apr 2013 19:57:01 -0400 (EDT)
Date: Fri, 05 Apr 2013 19:57:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20130405235701.GH31233@denix.org>
References: <1365007710-12866-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1365007710-12866-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] tisdk-image: add support for DTB files
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
X-List-Received-Date: Fri, 05 Apr 2013 23:57:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 03, 2013 at 11:48:30AM -0500, Chase Maupin wrote:
> * If DTB files exist add support for copying those files into
>   the SDK prebuilt-images directory.
> * The files to be copied can be controlled using the DTB_FILTER
>   variable.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta-arago-distro/classes/tisdk-image.bbclass |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
> index a1ce1ad..4e3ed52 100644
> --- a/meta-arago-distro/classes/tisdk-image.bbclass
> +++ b/meta-arago-distro/classes/tisdk-image.bbclass
> @@ -528,6 +528,16 @@ do_sdk_image () {
>          return 1
>      fi

I was thinking of adding DTB_FILTER ?= "unknown" here, but then realized it 
would just waste few cycles trying to find something in the deploy directory, 
which we can avoid completely by testing if it set or not...


> +    # Copy the DTB files if they exist.
> +    # NOTE: For simplicity remove the uImage- prefix on the dtb files.  Get just the symlink
> +    #       files for a cleaner name.  Use the DTB_FILTER variable to allow finding the
> +    #       dtb files for only that MACHINE type

Wrap the below for loop in "if [ -z "${DTB_FILTER}" ]; then" here?


> +    for f in `find ${DEPLOY_DIR_IMAGE} -type l -name "*${DTB_FILTER}*.dtb"`
> +    do
> +        dtb_file=`basename $f | sed s/uImage-//`
> +        cp $f ${prebuilt_dir}/${dtb_file}
> +    done
> +
>      if [ "${SECONDARY_BOOTLOADER_NAME}" != "" ]
>      then
>          # Copy the secondary bootloader image if it exists
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

