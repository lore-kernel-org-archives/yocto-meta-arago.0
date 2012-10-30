Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CBB2A5209D
	for <meta-arago@arago-project.org>;
	Tue, 30 Oct 2012 19:48:02 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9UJm1ON014683
	for <meta-arago@arago-project.org>; Tue, 30 Oct 2012 14:48:01 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9UJm132031162
	for <meta-arago@arago-project.org>; Tue, 30 Oct 2012 14:48:01 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 30 Oct 2012 14:48:01 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q9UJm1GR006755;
	Tue, 30 Oct 2012 14:48:01 -0500
Date: Tue, 30 Oct 2012 15:48:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20121030194801.GH11551@edge>
References: <8F29D6B095ED194EA1980491A5E029710C30CDB1@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C30CDB1@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: task-arago-qte-toolchain-target: standard qte target sdk packages
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
X-List-Received-Date: Tue, 30 Oct 2012 19:48:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 26, 2012 at 02:30:12PM +0000, Cooper Jr., Franklin wrote:
> This task duplicates task-arago-qte-sdk-target quite a bit.
> http://arago-project.org/git/?p=meta-arago.git;a=blob_plain;f=meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb;hb=HEAD

Correct. The reason for the duplication is that it goes into extras vs. 
distro, since the corresponding meta-toolchain-qte is also there.


> I don't see a need for both tasks so most likely we will get rid of 
> task-arago-qte-sdk-target. Only thing I see that your task doesn't include 
> is "qt4-embedded-dev" which I would think is also needed.

Yes, I saw that. I didn't have time to check whether qt4-embedded-dev is being 
pulled automatically. I'll verify that and if needed, add it back.

I have also noticed MySQL is being built though, which I started looking into, 
but wasn't able to finish before the hurricane...

-- 
Denys


> -----Original Message-----
> From: Arago Project git [mailto:git@arago-project.org] 
> Sent: Friday, October 26, 2012 12:05 AM
> To: arago-commits@arago-project.org
> Subject: [arago-commits] Denys Dmytriyenko : task-arago-qte-toolchain-target: standard qte target sdk packages
> 
> Module: meta-arago
> Branch: master
> Commit: 0013364df6cdcf1c505087e1064ee321b36d8f76
> URL:    http://arago-project.org/git/meta-arago.git?a=commit;h=0013364df6cdcf1c505087e1064ee321b36d8f76
> 
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Fri Oct 26 01:02:52 2012 -0400
> 
> task-arago-qte-toolchain-target: standard qte target sdk packages
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> ---
> 
>  .../tasks/task-arago-qte-toolchain-target.bb       |   31 ++++++++++++++++++++
>  1 files changed, 31 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb
> new file mode 100644
> index 0000000..67b2fbc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "Target packages for Qt Embedded SDK"
> +LICENSE = "MIT"
> +ALLOW_EMPTY = "1"
> +
> +PR = "r1"
> +
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> +                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +RDEPENDS_${PN} += " \
> +        task-core-standalone-sdk-target \
> +        qt4-embedded-mkspecs \
> +        libqt-embeddedmultimedia4-dev \
> +        libqt-embeddedphonon4-dev \
> +        libqt-embedded3support4-dev \
> +        libqt-embeddedclucene4-dev \
> +        libqt-embeddedcore4-dev \
> +        libqt-embeddeddbus4-dev \
> +        libqt-embeddeddesignercomponents4-dev \
> +        libqt-embeddeddesigner4-dev \
> +        libqt-embeddeduitools4-dev \
> +        libqt-embeddedgui4-dev \
> +        libqt-embeddedhelp4-dev \
> +        libqt-embeddednetwork4-dev \
> +        libqt-embeddedscript4-dev \
> +        libqt-embeddedscripttools4-dev \
> +        libqt-embeddedsvg4-dev \
> +        libqt-embeddedtest4-dev \
> +        libqt-embeddedwebkit4-dev \
> +        libqt-embeddedxml4-dev \
> +        "
> 
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

