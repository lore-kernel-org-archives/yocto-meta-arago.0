Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 30A95529D4
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 00:53:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r480rpgv020574
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 19:53:51 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r480rpNI000779
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 19:53:51 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 19:53:50 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r480roBV026511;
	Tue, 7 May 2013 19:53:50 -0500
Date: Tue, 7 May 2013 20:53:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sajesh Kumar Saran <sajesh@ti.com>
Message-ID: <20130508005349.GM12982@edge>
References: <1367971342-12085-1-git-send-email-sajesh@ti.com>
MIME-Version: 1.0
In-Reply-To: <1367971342-12085-1-git-send-email-sajesh@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] multiprocmgr: recipe update for external git and mpm changes
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
X-List-Received-Date: Wed, 08 May 2013 00:53:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 07, 2013 at 08:02:22PM -0400, Sajesh Kumar Saran wrote:
> the recipe is renamed to ti-multiprocmgr

We've been there before:
http://arago-project.org/pipermail/meta-arago/2013-February/000878.html

While it is probably not very critical, I still think we should not abuse ti- 
prefix that much. At some point we had every own recipe starting with ti- and 
there were a lot of them. It is just redundant at a minimum...


> and updated to support
> mpm daemon and kernel dependancies.
> 
> Signed-off-by: Sajesh Kumar Saran <sajesh@ti.com>
> ---
>  .../recipes-bsp/multiprocmgr/multiprocmgr_git.bb   |   20 ----------
>  .../ti-multiprocmgr/ti-multiprocmgr_git.bb         |   42 ++++++++++++++++++++
>  2 files changed, 42 insertions(+), 20 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-multiprocmgr/ti-multiprocmgr_git.bb

Please use -M flag for git-format-patch to detect renames, so it would look 
like a patch/diff instead of removing old file and adding a new one.


> diff --git a/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb b/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb
> deleted file mode 100644
> index 3f2e52c..0000000
> --- a/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION = "TI Multiproc Manager for KeyStone II"
> -HOMEPAGE = "http://gtgit01.gt.design.ti.com/git/?p=projects/multiprocmgr.git;a=summary"
> -LICENSE = "BSD & MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
> -SECTION = "console"
> -COMPATIBLE_MACHINE = "keystone"
> -
> -PR = "r1"
> -
> -BRANCH ?= "master"
> -SRCREV = "8a97fb5c2c06d5f02d30106629f27fe0ca8a4f95"
> -
> -SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.git;protocol=git;branch=${BRANCH}"
> -
> -S = "${WORKDIR}/git"
> -
> -do_install() {
> -	install -d ${D}${bindir}/
> -	install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv
> -}
> diff --git a/meta-arago-extras/recipes-bsp/ti-multiprocmgr/ti-multiprocmgr_git.bb b/meta-arago-extras/recipes-bsp/ti-multiprocmgr/ti-multiprocmgr_git.bb
> new file mode 100644
> index 0000000..951dc3c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-multiprocmgr/ti-multiprocmgr_git.bb
> @@ -0,0 +1,42 @@
> +DESCRIPTION = "TI Multiproc Manager for KeyStone II"
> +HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-linux/multi-proc-manager.git"

That is a good name used for the repository name! Why not match it instead?


> +LICENSE = "BSD & MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
> +SECTION = "console"
> +COMPATIBLE_MACHINE = "keystone"
> +
> +DEPENDS = "libdaemon virtual/kernel"
> +RDEPENDS = "syslog-ng"

What is the run-time dependency on syslog-ng here?


> +PR = "r6"
> +
> +BRANCH ?= "master"
> +SRCREV = "${AUTOREV}"

You're abusing AUTOREV here - there were only ~35 commits total in 6 month! 
Just use the specific commit ID, it doesn't seem to change too often.


> +SRC_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +CC += "-I${STAGING_KERNEL_DIR}/include"
> +
> +INITSCRIPT_NAME = "mpmsrv-daemon.sh"
> +INITSCRIPT_PARAMS = "defaults 10"
> +
> +inherit update-rc.d
> +
> +do_install() {
> +	install -d ${D}${bindir}/
> +	install -c -m 755 ${S}/bin/mpmsrv ${D}${bindir}/mpmsrv
> +	install -c -m 755 ${S}/bin/mpmcl ${D}${bindir}/mpmcl
> +
> +	install -d ${D}${sysconfdir}/init.d/
> +	install -c -m 755 ${S}/mpmsrv-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> +	install -d ${D}${sysconfdir}/mpm/
> +	install -c -m 755 ${S}/mpm_config.json ${D}${sysconfdir}/mpm/mpm_config.json
> +
> +	install -d ${D}${includedir}/
> +	install -c -m 755 ${S}/include/* ${D}${includedir}/
> +
> +	install -d ${D}${libdir}/
> +	install -c -m 755 ${S}/lib/* ${D}${libdir}/
> +}
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

