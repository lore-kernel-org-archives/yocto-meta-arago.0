Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id BA75352985
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2018 19:48:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w87JmATY107890
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 14:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536349690;
	bh=31A9ZOqA9gCX1ux3BTiM7FbL68Yfv4DAOHUhPA/5jC4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=csMCB0CnudAgcSZ7gGYPgttoV5DvddesYKq3JT09A0+BBNTLEbrdp7GTEY8l2jaaL
	OtpOmTLRd440KIVOI1uUiAwawLTqylG5CgnRdU6ysW906gyDRKIgy+tLtbnIKqDdDQ
	pz+jlRBvkdTDT5R71U5UzCdHAhGwNeceNlSDzSCI=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87JmAaD027157
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 14:48:10 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 7 Sep 2018 14:48:10 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 7 Sep 2018 14:48:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87JmAqo002665;
	Fri, 7 Sep 2018 14:48:10 -0500
Date: Fri, 7 Sep 2018 15:46:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Qin Su <qsu@ti.com>
Message-ID: <20180907194638.GD25348@beryl>
References: <1536349279-1713-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1536349279-1713-1-git-send-email-qsu@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] Revert "protobuf-tidl: protobuf version 3.2.0."
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
X-List-Received-Date: Fri, 07 Sep 2018 19:48:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 07, 2018 at 03:41:19PM -0400, Qin Su wrote:
> This reverts commit 4d2cba1b52da4f1e3f71b23c71c9aaf615e3d794.

http://arago-project.org/git/?p=meta-arago.git;a=commit;h=4d2cba1b52da4f1e3f71b23c71c9aaf615e3d794

403 Forbidden - Unknown commit object


> ---
>  .../protobuf-tidl/protobuf-tidl_3.2.0.bb           | 38 ----------------------
>  1 file changed, 38 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-support/protobuf-tidl/protobuf-tidl_3.2.0.bb
> 
> diff --git a/meta-arago-extras/recipes-support/protobuf-tidl/protobuf-tidl_3.2.0.bb b/meta-arago-extras/recipes-support/protobuf-tidl/protobuf-tidl_3.2.0.bb
> deleted file mode 100644
> index d67529a..0000000
> --- a/meta-arago-extras/recipes-support/protobuf-tidl/protobuf-tidl_3.2.0.bb
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -SUMMARY = "Protocol Buffers - structured data serialisation mechanism"
> -DESCRIPTION = "Protocol Buffers are a way of encoding structured data in an \
> -efficient yet extensible format. Google uses Protocol Buffers for almost \
> -all of its internal RPC protocols and file formats. This recipe is needed for \
> -compatiblity with TIDL 1.1.0 release, Linux x86 version of import tool"
> -
> -HOMEPAGE = "https://github.com/google/protobuf"
> -SECTION = "console/tools"
> -LICENSE = "BSD-3-Clause"
> -
> -PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
> -
> -DEPENDS = "zlib"
> -RDEPENDS_${PN}-compiler = "${PN}"
> -RDEPENDS_${PN}-dev += "${PN}-compiler"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
> -
> -SRCREV = "593e917c176b5bc5aafa57bf9f6030d749d91cd5"
> -
> -PV = "3.2.0+git${SRCPV}"
> -
> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.2.x"
> -
> -EXTRA_OECONF_class-target     = " --with-protoc=echo"
> -EXTRA_OECONF_class-native     = " --with-protoc=echo"
> -EXTRA_OECONF_class-native    += "CFLAGS="-m32 -DNDEBUG" CXXFLAGS="-m32 -DNDEBUG" LDFLAGS=-m32"
> -
> -inherit autotools-brokensep
> -
> -S = "${WORKDIR}/git"
> -
> -FILES_${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
> -FILES_${PN}-lite = "${bindir} ${libdir}/libprotobuf-lite${SOLIBS}"
> -
> -MIPS_INSTRUCTION_SET = "mips"
> -
> -BBCLASSEXTEND = "native"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

