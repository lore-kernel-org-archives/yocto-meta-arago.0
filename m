Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A978C529B9
	for <meta-arago@arago-project.org>;
	Mon,  9 Sep 2019 18:25:40 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89IOZ2j073272
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 13:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568053475;
	bh=Zc+HK4AP3Jc8RPTJFN7YUoUnenggxXcEgAUGFVsCWu8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AjFEO2qYQ2ZmN2JOgdDeh8/nPJSNZ957idQVf7epNK+G1RctnW/GtFteI0gXWSKra
	4YxJAMNld/ygjkMlOa8N6VbkrItOStVSwc7AJpEhv5KMpYJ8h2gbC3wcCZsbUXJKvJ
	mhtGokJff/pwOzz2JbZeT/oqd6a4YbyRNnoHUDc8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89IOZw8104680
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 13:24:35 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 9 Sep 2019 13:24:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 9 Sep 2019 13:24:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89IOYh8092558;
	Mon, 9 Sep 2019 13:24:34 -0500
Date: Mon, 9 Sep 2019 14:24:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20190909182434.GB19813@beryl>
References: <1567760926-52760-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <1567760926-52760-1-git-send-email-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [ [thud/master] PATCH v1] recipes-devtools: glsdk-util-scripts: update for j7-evm
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
X-List-Received-Date: Mon, 09 Sep 2019 18:25:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Please no nested brackets - patchwork can't handle those properly:
> Subject: [[meta-arago] [thud/master] PATCH v1] recipes-devtools:


On Fri, Sep 06, 2019 at 02:38:46PM +0530, Nikhil Devshatwar wrote:
> update SRCREV and compatible machine for j7-evm
> Install scripts with execute permissions
> Add bash as RDEPENDS
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  .../recipes-devtools/util-scripts/glsdk-util-scripts.bb      | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
> index a0ca56a..abe9ad9 100644
> --- a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
> +++ b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
> @@ -3,12 +3,13 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://debug/filter-dmesg-rproc.sh;md5=ce264e7cbc036fd2f37073947c2f0800"
>  PR = "r1"
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "omap-a15|j7-evm"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> +RDEPENDS_${PN} += "bash"
>  
>  SRC_URI = "git://git.ti.com/glsdk/util-scripts.git"
>  
> -SRCREV = "ecbb9cd13e1728686a82e87e5c1b325c0e806202"
> +SRCREV = "df50ca1592cae97ad0c7285686d602926b4f7305"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -20,8 +21,11 @@ do_install() {
>      install -d ${D}${datadir}/ti/util-scripts
>      install -d ${D}${datadir}/ti/util-scripts/debug
>      install -d ${D}${datadir}/ti/util-scripts/perf
> -    install -m 0644 ${S}/debug/* ${D}${datadir}/ti/util-scripts/debug/.
> -    install -m 0644 ${S}/perf/* ${D}${datadir}/ti/util-scripts/perf/.
> +    install -d ${D}${datadir}/ti/util-scripts/demo
> +    install -m 755 ${S}/debug/* ${D}${datadir}/ti/util-scripts/debug/.
> +    install -m 755 ${S}/perf/* ${D}${datadir}/ti/util-scripts/perf/.
> +    install -m 755 ${S}/demo/* ${D}${datadir}/ti/util-scripts/demo/.
> +
>  }
>  
>  FILES_${PN} += "${datadir}/ti/util-scripts/*"
> -- 
> 1.9.1
> 

