Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id DEFD252981
	for <meta-arago@arago-project.org>;
	Thu, 18 Apr 2013 19:43:46 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MLG000G7URZ9SG0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 18 Apr 2013 14:43:17 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C7893201AD; Thu,
	18 Apr 2013 15:43:11 -0400 (EDT)
Date: Thu, 18 Apr 2013 15:43:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20130418194310.GC21029@denix.org>
References: <1366306781-17062-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1366306781-17062-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] am33x-cm3: remove the SRC_URI setting
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
X-List-Received-Date: Thu, 18 Apr 2013 19:43:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 18, 2013 at 12:39:41PM -0500, Chase Maupin wrote:
> * The base recipe SRC_URI has been updated so remove the setting
>   that overwrites this.  This was preventing picking up the
>   init script required to load the firmware
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend  |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend b/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend
> index 61547e3..826f250 100644
> --- a/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend
> +++ b/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago0"
> +PR_append = "-arago1"
>  
>  PV = "05.06.00.00"
>  
> @@ -6,5 +6,3 @@ BRANCH = "master"
>  
>  #This SRCREV corresponds to tag AM335xPSP_04.06.00.09-rc
>  SRCREV = "7c6075f28d9fdd633175cdbd8dc287613ce92e5d"

Not a part of your patch, but can we sync up on the commit ID or release 
version? meta-ti uses once commit ID and sets PV as 04.06.00.07 and meta-arago 
changes it to 04.06.00.09-rc.
Can we update those - git has tags for 04.06.00.08 and 04.06.00.10-rc1 besides 
the other two mentioned.

> -
> -SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git;protocol=git;branch=${BRANCH}"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

