Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id A76B052A0B
	for <meta-arago@arago-project.org>;
	Thu,  9 Aug 2012 22:21:09 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M8I00I8CE386SKF@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 09 Aug 2012 17:21:08 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 43C4620264; Thu,
	09 Aug 2012 18:21:07 -0400 (EDT)
Date: Thu, 09 Aug 2012 18:21:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Franklin S Cooper Jr <fcooper@ti.com>
Message-id: <20120809222107.GB9728@denix.org>
References: <1344535813-10364-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1344535813-10364-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [branches: master][PATCH] base-files: Add in custom Arago prelogin message
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
X-List-Received-Date: Thu, 09 Aug 2012 22:21:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Franklin,

I already pushed another version of this patch 2 days ago:

http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=7161310feffd8d09ef753610a9ce27f77c222ee0

That one had fstab changes - and I was wondering why you were asking about 
tmpfs size today...


BTW, are you subscribed to arago-commits mailing list?

http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits

--
Denys


On Thu, Aug 09, 2012 at 01:10:13PM -0500, Franklin S Cooper Jr wrote:
> * Override issues.net to add custom prelogin message when connected via telnet
> * Override issues to add custom prelogin message when connected via
>   network/serial (not including telnet)
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/base-files/base-files/issue       |    8 ++++++++
>  .../recipes-core/base-files/base-files/issue.net   |    8 ++++++++
>  .../base-files/base-files_3.0.14.bbappend          |    4 ++++
>  3 files changed, 20 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-core/base-files/base-files/issue
>  create mode 100644 meta-arago-extras/recipes-core/base-files/base-files/issue.net
>  create mode 100644 meta-arago-extras/recipes-core/base-files/base-files_3.0.14.bbappend
> 
> diff --git a/meta-arago-extras/recipes-core/base-files/base-files/issue b/meta-arago-extras/recipes-core/base-files/base-files/issue
> new file mode 100644
> index 0000000..4f22fd9
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/base-files/base-files/issue
> @@ -0,0 +1,8 @@
> + _____                    _____           _         _   
> +|  _  |___ ___ ___ ___   |  _  |___ ___  |_|___ ___| |_ 
> +|     |  _| .'| . | . |  |   __|  _| . | | | -_|  _|  _|
> +|__|__|_| |__,|_  |___|  |__|  |_| |___|_| |___|___|_|  
> +              |___|                    |___|            
> +
> +Arago Project http://arago-project.org \n \l
> +
> diff --git a/meta-arago-extras/recipes-core/base-files/base-files/issue.net b/meta-arago-extras/recipes-core/base-files/base-files/issue.net
> new file mode 100644
> index 0000000..8ce7207
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/base-files/base-files/issue.net
> @@ -0,0 +1,8 @@
> + _____                    _____           _         _   
> +|  _  |___ ___ ___ ___   |  _  |___ ___  |_|___ ___| |_ 
> +|     |  _| .'| . | . |  |   __|  _| . | | | -_|  _|  _|
> +|__|__|_| |__,|_  |___|  |__|  |_| |___|_| |___|___|_|  
> +              |___|                    |___|            
> +
> +Arago Project http://arago-project.org %h
> +
> diff --git a/meta-arago-extras/recipes-core/base-files/base-files_3.0.14.bbappend b/meta-arago-extras/recipes-core/base-files/base-files_3.0.14.bbappend
> new file mode 100644
> index 0000000..c0ab069
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/base-files/base-files_3.0.14.bbappend
> @@ -0,0 +1,4 @@
> +# look for files in this layer first
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +PR_append = "-arago0"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

