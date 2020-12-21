Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8B7B652A73
	for <meta-arago@arago-project.org>;
	Mon, 21 Dec 2020 23:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4303340B66;
	Mon, 21 Dec 2020 23:59:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bBvmf7Ac0uCI; Mon, 21 Dec 2020 23:59:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A7EEF40AE9;
	Mon, 21 Dec 2020 23:59:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7D70717434F; Mon, 21 Dec 2020 18:59:02 -0500 (EST)
Date: Mon, 21 Dec 2020 18:59:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <20201221235902.GF24670@denix.org>
References: <1608241346-15755-1-git-send-email-denis@denix.org>
	<814f721d-cc9c-a1c9-b88a-dcc08fa54a7d@ti.com>
MIME-Version: 1.0
In-Reply-To: <814f721d-cc9c-a1c9-b88a-dcc08fa54a7d@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master][PATCH] optee-os: as meta-ti now has upstream 3.11, drop local fork
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
X-List-Received-Date: Mon, 21 Dec 2020 23:59:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 17, 2020 at 05:31:23PM -0600, Bajjuri, Praneeth wrote:
> 
> 
> On 12/17/2020 3:42 PM, Denys Dmytriyenko wrote:
> >There's no need for ti-optee-os fork any more, as it's exactly the same as upstream
> 
> Thanks Denys for the fix.
> 
> This along with the meta-ti patch helped in building 3.11 on sdk builds.
> 
> One question though, While there is no difference today between TI
> and upstream optee, Any reason why we cannot use the forked project?
> Similar to how we are doing with ATF today ?

Praneeth,

From the community perspective, it's a bad practice to fork an upstream 
project "just in case", when there are no real differences...

Denys


> >Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> >---
> >  meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 7 -------
> >  1 file changed, 7 deletions(-)
> >  delete mode 100644 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >deleted file mode 100644
> >index 677c6dd..0000000
> >--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >+++ /dev/null
> >@@ -1,7 +0,0 @@
> >-PR_append = ".arago0"
> >-
> >-SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
> >-           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
> >-"
> >-BRANCH = "ti-optee-os"
> >-SRCREV = "199fca17b575d4c748c9c435e908a6ec9618c75a"
> >

