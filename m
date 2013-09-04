Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 31E24529D0
	for <meta-arago@arago-project.org>;
	Wed,  4 Sep 2013 22:47:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r84MldJL019789
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2013 17:47:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r84MldHQ018457
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2013 17:47:39 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Sep 2013 17:47:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r84MlcAk031916;
	Wed, 4 Sep 2013 17:47:38 -0500
Date: Wed, 4 Sep 2013 18:47:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130904224738.GC25135@edge>
References: <1377633092-29917-1-git-send-email-fcooper@ti.com>
	<1377633092-29917-3-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1377633092-29917-3-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/6 v2] board-port-labs-linux: Create new recipe using new sourceipk.bbclass feature
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
X-List-Received-Date: Wed, 04 Sep 2013 22:47:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Can we do away w/o using AUTOREV here? How often do you change the content in 
those repos? Would it be too much hassle to keep updating the recipe with the 
new SRCREV for every new (AM-)SDK release?

-- 
Denys

On Tue, Aug 27, 2013 at 02:51:29PM -0500, Franklin S. Cooper Jr wrote:
> * Do to the inability to keep the git repository intact the board port labs
>   recipe manually ran git clone which took a long time every time the recipe was
>   built.
> * Using the new SRCIPK_PRESERVED_GIT feature in sourceipk.bbclass the recipes can
>   now be treated like any other recipe and allow OE to handle the cloning and
>   unpacking.
> * This will significantly shorten the amount of time required to rebuild this
>   recipe.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Changes Version 2:
> Split recipe into its own patch.
> Also use the kernel's license.
> 
>  .../board-port-labs/board-port-labs-linux_git.bb   |   35 ++++++++++++++++++++
>  1 files changed, 35 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_git.bb
> 
> diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_git.bb
> new file mode 100644
> index 0000000..711e3a8
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_git.bb
> @@ -0,0 +1,35 @@
> +DESCRIPTION = "Git repositories containing sample board port code"
> +HOMEPAGE = "https://gitorious.org/sitara-board-port"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +
> +inherit allarch
> +
> +CREATE_SRCIPK = "1"
> +SRCIPK_INSTALL_DIR = "board-support/board-port-labs/sitara-board-port-linux"
> +SRCIPK_PRESERVE_GIT = "true"
> +
> +PR = "r0"
> +
> +BRANCH = "master"
> +SRC_URI = "git://gitorious.org/sitara-board-port/sitara-board-port-linux.git;protocol=git;branch=${BRANCH}"
> +
> +SRCREV = "${AUTOREV}"
> +
> +S = "${WORKDIR}/git"
> +
> +adjust_git_prepend() {
> +
> +    # Checkout a specific branch instead of a commit that is used by default
> +    git checkout ${BRANCH}
> +}
> +
> +do_configure() {
> +    :
> +}
> +
> +do_compile() {
> +    :
> +}
> +
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

