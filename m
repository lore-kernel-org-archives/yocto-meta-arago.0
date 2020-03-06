Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 6DDA8529C3
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2020 00:40:25 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0260cLub082435
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 18:38:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583455101;
	bh=lc6MFfRKzDsCsH4rNm1UWBpF8oFb1UmfPH8oukhn9Ic=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=m2Jc0BjC0W60IbXov6MRltLbowbVvkKLveJhsQxPCnnpNeK0v0UqKo4wDf14dDHw1
	z1rQnzKbjTOT1Rd5WgCg0tA6s+Q+HOAtIFwib2zs5vQmlVgC+HOAqVF+TTJKjNccmk
	Yc30M5psH1KxCAGXAM395T+uYCM0214giVVSPJ8E=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0260cLQX062508
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 18:38:21 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 5 Mar 2020 18:38:21 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 5 Mar 2020 18:38:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0260cLGN019893;
	Thu, 5 Mar 2020 18:38:21 -0600
Date: Thu, 5 Mar 2020 19:38:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
Message-ID: <20200306003821.GU1628@beryl>
References: <20200305230031.5482-1-afd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200305230031.5482-1-afd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus/master][PATCH] dma-heap-tests: add tests for DMA-Heap framework
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
X-List-Received-Date: Fri, 06 Mar 2020 00:40:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 05, 2020 at 06:00:31PM -0500, Andrew F. Davis wrote:
> Add some tests for the DMA-Heap framework. Based on ion-tests.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  .../recipes-devtools/dma-heap/dma-heap-tests.bb  | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
> new file mode 100644
> index 00000000..9693fe64
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Test cases for DMA-Heap framework"
> +HOMEPAGE = "https://github.com/glneo/dma-heap-tests"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://src/heap_test_fixture.cpp;beginline=1;endline=15;md5=d16465a9e7dc8f53bfdf997c4bf55540"
> +
> +PV = "1.0"
> +
> +BRANCH = "master"
> +SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=git;branch=${BRANCH}"
> +SRCREV = "bccbfbf24baccefa09439a924f61f04e82b3910a"
> +
> +DEPENDS = "googletest"

Ah, right, almost missed that gtest got renamed to googletest.

Since this is based on ion-tests, do you want to place it in "ion" folder or 
keep it in its own?


> +S = "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig
> -- 
> 2.17.1
> 

