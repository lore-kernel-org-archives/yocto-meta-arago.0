Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id 4726E52A5D
	for <meta-arago@arago-project.org>;
	Fri, 15 Feb 2013 01:21:18 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MI8006S5MEMN5I1@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 14 Feb 2013 19:21:01 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 523AF2008D; Thu,
	14 Feb 2013 20:20:46 -0500 (EST)
Date: Thu, 14 Feb 2013 20:20:46 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sajesh Kumar Saran <sajesh@ti.com>
Message-id: <20130215012046.GC9154@denix.org>
References: <1360880920-24652-1-git-send-email-sajesh@ti.com>
MIME-version: 1.0
In-reply-to: <1360880920-24652-1-git-send-email-sajesh@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] Added ti-multiproc manager recipe for KeyStone2 devices
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
X-List-Received-Date: Fri, 15 Feb 2013 01:21:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Sajesh,

Thanks for submitting your patch to the list. It mostly looks good, but here 
are few comments:

[PATCH] Added ti-multiproc manager recipe for KeyStone2 devices

Please follow the OpenEmbedded Patch Message Guidelines:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Basically, it means the commit/patch subject should look like this:

[PATCH] multiprocmgr: add initial version


On Thu, Feb 14, 2013 at 05:28:40PM -0500, Sajesh Kumar Saran wrote:
> 
> Signed-off-by: Sajesh Kumar Saran <sajesh@ti.com>
> ---
>  .../multiprocmgr/ti-multiprocmgr_git.bb            |   19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.bb
> 
> diff --git a/meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.bb b/meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.bb
> new file mode 100644
> index 0000000..c72bc7d
> --- /dev/null
> +++ b/meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.bb

I don't mind it too much, but do we still need to abuse ti-* prefix for our 
own software? Can it be simply multiprocmgr?


> @@ -0,0 +1,19 @@
> +DESCRIPTION = "TI Multiproc Manager for KeyStone II"
> +HOMEPAGE = "http://gtgit01.gt.design.ti.com/git/?p=projects/multiprocmgr.git;a=summary"
> +LICENSE = "BSD & MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
> +SECTION = "console"

If you really want this to be available to Keystone machines, you'd want:

COMPATIBLE_MACHINE = "keystone"


> +PR = "r2"

I don't usually complain about PR being out of sequence, or starting with 1 
vs. 0, but other people may find this a problem. Just FYI...


> +BRANCH ?= "master"

> +SRCREV = "${AUTOREV}"
> +SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.git;protocol=git;branch=${BRANCH}"

The use of AUTOREV and non-public internal git repository would break parsing 
for anyone doing builds outside of TI network.

Using non-public internal git repository temporarily until you get your 
project published externally is somewhat acceptable. And AUTOREV in rare cases 
is also acceptable, although it's quite unstable. But definitely don't use 
them both.


> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +	install -d ${D}${bindir}/
> +	install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv
> +}
> -- 
> 1.7.9.5

