Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTP id 4B97752A5A
	for <meta-arago@arago-project.org>;
	Fri, 15 Feb 2013 03:18:55 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MI8000UBRUQEIS4@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 14 Feb 2013 21:18:36 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2F2C12008D; Thu,
	14 Feb 2013 22:18:25 -0500 (EST)
Date: Thu, 14 Feb 2013 22:18:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sajesh Kumar Saran <sajesh@ti.com>
Message-id: <20130215031825.GD9154@denix.org>
References: <1360894127-24242-1-git-send-email-sajesh@ti.com>
MIME-version: 1.0
In-reply-to: <1360894127-24242-1-git-send-email-sajesh@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] multiprocmgr: add initial version
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
X-List-Received-Date: Fri, 15 Feb 2013 03:18:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 14, 2013 at 09:08:46PM -0500, Sajesh Kumar Saran wrote:
> This is an initial version of commit of multiproc manager.
> It adds support to download DSP images from ARM in KeyStone II
> devices.
> 
> Signed-off-by: Sajesh Kumar Saran <sajesh@ti.com>
> ---
>  .../multiprocmgr/multiprocmgr_git.bb               |   20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-devtools/multiprocmgr/multiprocmgr_git.bb

I pushed it with one little change - moved it to meta-arago-extras/recipes-bsp

-- 
Denys


> diff --git a/meta-arago-distro/recipes-devtools/multiprocmgr/multiprocmgr_git.bb b/meta-arago-distro/recipes-devtools/multiprocmgr/multiprocmgr_git.bb
> new file mode 100644
> index 0000000..3f2e52c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-devtools/multiprocmgr/multiprocmgr_git.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "TI Multiproc Manager for KeyStone II"
> +HOMEPAGE = "http://gtgit01.gt.design.ti.com/git/?p=projects/multiprocmgr.git;a=summary"
> +LICENSE = "BSD & MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
> +SECTION = "console"
> +COMPATIBLE_MACHINE = "keystone"
> +
> +PR = "r1"
> +
> +BRANCH ?= "master"
> +SRCREV = "8a97fb5c2c06d5f02d30106629f27fe0ca8a4f95"
> +
> +SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +	install -d ${D}${bindir}/
> +	install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv
> +}
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

