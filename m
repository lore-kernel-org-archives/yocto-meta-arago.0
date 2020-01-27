Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 2B7BC52994
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2020 19:47:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RJjua9122176
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2020 13:45:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580154356;
	bh=pvz1hCJNp40UHuhn+2hL45Oq4PHAWO6u7go65aHTuyg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GrOjla3rUvih1xIz3ZIglXOGYy9mbrnWEJs4VLj0LozPbOCx/rpPJzICstUAee5Ma
	8F6x1zBh0x6qpG4wVT9hSQc6PfzlDAs7S//bwieaXx57z1cIB7vO7NKWJFPC/sa7tW
	L4QcrGjLFAuYNFPwWqcir3Yo+qNtlhgMlwT5+PtE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RJju8c068149
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2020 13:45:56 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 27 Jan 2020 13:45:55 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 27 Jan 2020 13:45:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RJjtwg065330;
	Mon, 27 Jan 2020 13:45:55 -0600
Date: Mon, 27 Jan 2020 14:45:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
Message-ID: <20200127194555.GW3658@beryl>
References: <20200127162616.24864-1-afd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200127162616.24864-1-afd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/thud][PATCH] screenshot: Remove this screenshot tool in favor of fbgrab
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
X-List-Received-Date: Mon, 27 Jan 2020 19:47:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 27, 2020 at 11:26:16AM -0500, Andrew F. Davis wrote:
> This takes a screenshot of the current framebuffer only. There are tools
> for taking screenshots of the current window system which is usually what
> a user wants. If the user really wants the conent of the framebuffer then
> they can use fbgrab which is already in meta-oe.

I'm not 100% sure, but I believe there's some use of screeshot tool in Matrix 
demos. I guess we would need to update that too for this change.

Jake, any comments from OOBE perspective?

Denys


> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  .../packagegroup-arago-tisdk-amsdk.bb         |  5 ----
>  .../screenshot/screenshot_1.0.bb              | 27 -------------------
>  2 files changed, 32 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
> index 42c6aefa..c9a17c5e 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
> @@ -17,11 +17,6 @@ OOBE_ti43x += "\
>      parse-ip \
>  "
>  
> -EXTRA_APPLICATIONS = "\
> -    screenshot \
> -"
> -
>  RDEPENDS_${PN} = "\
>      ${OOBE} \
> -    ${EXTRA_APPLICATIONS} \
>  "
> diff --git a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
> deleted file mode 100644
> index 08a3040b..00000000
> --- a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY = "Screenshot"
> -HOMEPAGE = "https://gitorious.org/screenshot"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=5cad16cc3f514a15adb1d710b82d5fc4"
> -SECTION = "graphics"
> -
> -PR = "r2"
> -
> -BRANCH ?= "master"
> -SRCREV = "169242aa7a265d5c94755d74601ad4a3f1828c96"
> -
> -SRC_URI = "git://git.ti.com/apps/screenshot.git;protocol=git;branch=${BRANCH}"
> -
> -S = "${WORKDIR}/git"
> -
> -do_compile() {
> -    export CROSS_COMPILE=${TARGET_PREFIX}
> -    export CFLAGS='${TARGET_CC_ARCH}'
> -    # build the release version
> -    make release CC="${CC}"
> -}
> -
> -do_install() {
> -    make DESTDIR=${D} install
> -}
> -
> -INSANE_SKIP_${PN} = "ldflags"
> -- 
> 2.17.1
> 

