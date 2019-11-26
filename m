Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8D41D529BC
	for <meta-arago@arago-project.org>;
	Tue, 26 Nov 2019 17:33:37 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAQHW8mw099038
	for <meta-arago@arago-project.org>; Tue, 26 Nov 2019 11:32:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574789528;
	bh=oLmcW49dVlYpoRKbGbE0NdTnMjxz1weY7FglNQtmP/U=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=rwq5Dg+EX/ZZm2jJDwWaZ4MNhTWGJ5kb+Svg6oU37I41fAAunVwc99PTaE1zkOsJU
	oGSsF4DdwcNO2kn+94ZJesG/ZZ1r15h+ETPvDKi0HJ+v8myR9hzaTFiRPgM7pR8/Me
	fDC6MfdfaYG2J5nFdQ3rC4lk4PxdRYXpL5RDsahY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAQHW87R036222
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Nov 2019 11:32:08 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 26 Nov 2019 11:32:07 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 26 Nov 2019 11:32:07 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAQHW7Wo036035;
	Tue, 26 Nov 2019 11:32:07 -0600
To: Jianzhong Xu <xuj@ti.com>, <meta-arago@arago-project.org>
References: <20191126151356.26073-1-xuj@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <31fdbf84-9ba1-f88e-cfa2-6db7864d2941@ti.com>
Date: Tue, 26 Nov 2019 12:32:07 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126151356.26073-1-xuj@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH v2] neo-ai-dlr: fix dlr runtime problem
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
X-List-Received-Date: Tue, 26 Nov 2019 17:33:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11/26/2019 10:13 AM, Jianzhong Xu wrote:
> * bump up neo-ai-dlr SRCREV
> * add a patch to skip git cloning during cmake configuration
> * move libdlr.so to python site-packages dlr folder
> * add neo-ai-dlr-tests to target file system
> * change testing scripts' path to be the same as in source code
>
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>   .../packagegroup-arago-tisdk-addons.bbappend  |  2 +-
>   ...akeLists-skip-cloning-of-googletests.patch | 50 +++++++++++++++++++
>   recipes-support/neo-ai/neo-ai-dlr_git.bb      | 25 ++++++----
>   3 files changed, 65 insertions(+), 12 deletions(-)
>   create mode 100644 recipes-support/neo-ai/files/0001-CMakeLists-skip-cloning-of-googletests.patch
>
...
> diff --git a/recipes-support/neo-ai/neo-ai-dlr_git.bb b/recipes-support/neo-ai/neo-ai-dlr_git.bb
> index cbf4447..f0cf3e8 100644
> --- a/recipes-support/neo-ai/neo-ai-dlr_git.bb
> +++ b/recipes-support/neo-ai/neo-ai-dlr_git.bb
> @@ -26,9 +26,10 @@ SRC_URI = "git://github.com/neo-ai/neo-ai-dlr;protocol=https;branch=${BRANCH};na
>              git://github.com/neo-ai/treelite;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite;name=neo-ai-treelite \
>              git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite/dmlc-core;name=neo-ai-treelite-dmlc-core \
>              git://github.com/fmtlib/fmt;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/fmt;name=neo-ai-treelite-fmt \
> +           file://0001-CMakeLists-skip-cloning-of-googletests.patch \
>   "
>   
> -SRCREV_neo-ai-dlr = "dd9c8e806065b2c0fca97209c8bfd1cce0749ea9"
> +SRCREV_neo-ai-dlr = "35ed4fa2607056608451d85508fea70f458a14a6"
>   SRCREV_neo-ai-tvm = "44779571412930681eef9e8b9d32aa845b8cc5ad"
>   SRCREV_neo-ai-tvm-dmlc-core = "4d49691f1a9d944c3b0aa5e63f1db3cad1f941f8"
>   SRCREV_neo-ai-tvm-dlpack = "bee4d1dd8dc1ee4a1fd8fa6a96476c2f8b7492a3"
> @@ -45,26 +46,28 @@ do_install() {
>       # This does not do anything
>       #cmake_do_install
>   
> -    install -d ${D}${libdir}
> -    install -m 0644 ${S}/lib/* ${D}${libdir}
> +    install -d ${D}${includedir}/dlr_tflite
> +    install -m 0644 ${S}/include/*.h ${D}${includedir}
> +    install -m 0644 ${S}/include/dlr_tflite/*.h ${D}${includedir}/dlr_tflite
>   
> -    install -d ${D}${includedir}
> -    install -m 0644 ${S}/include/* ${D}${includedir}
> +    # Copy build directory to Python installation search path
> +    cp -r ${B} ${S}


Can you set B = "${S}/build" instead?


>   
> +    # Install DLR Python binding
>       cd ${S}/python
>       distutils3_do_install
> -    cd ${B}
>   
> -    # setup.py install some libs under datadir, but we don't need them, so remove.
> -    rm ${D}${datadir}/dlr/*.so


Can you still remove this file? Packaging now gives a warning:

QA Issue: neo-ai-dlr: Files/directories were installed but not shipped 
in any package:
   /usr/share/dlr/libdlr.so


> +    # Install DLR library to Python import search path
> +    install -m 0644 ${S}/build/lib/libdlr.so ${D}${PYTHON_SITEPACKAGES_DIR}/dlr
>   
>       # Now install python test scripts
> -    install -d ${D}${datadir}/dlr/tests
> -    install -m 0644 ${S}/tests/python/integration/*.py ${D}${datadir}/dlr/tests/
> +    install -d ${D}${datadir}/neo-ai-dlr/tests/python/integration
> +    install -m 0644 ${S}/tests/python/integration/*.py ${D}${datadir}/neo-ai-dlr/tests/python/integration
> +    install -m 0644 ${S}/tests/python/integration/*.npy ${D}${datadir}/neo-ai-dlr/tests/python/integration
>   }
>   
>   PACKAGES =+ "${PN}-tests"
> -FILES_${PN}-tests = "${datadir}/dlr/tests"
> +FILES_${PN}-tests = "${datadir}/neo-ai-dlr/tests"
>   RDEPENDS_${PN}-tests += "${PN}"
>   
>   # Versioned libs are not produced

