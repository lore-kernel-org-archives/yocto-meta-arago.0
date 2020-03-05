Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D573652995
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2020 21:26:56 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 025LOrQT037788
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 15:24:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583443493;
	bh=darylks4y0c9F/3ALkXFc83sDD1d6utcN6tTqEFF+og=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=R0Yog8BjNC4eqeOno5cpHg0Grg7fegVMFXEoycnRXpC2qSTK5rSYOkBwm5kx8eivD
	J9RbJJpLvzDZHJBmNeKlItT+YvQTpPIUM5ff+MW/Gtuotw3CWvkxGJgSF2BA7PT/7Q
	y/HCOfmiicLH2bXkuereBytXcfiIgmFmkMWewzm4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 025LOrO4050423
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 15:24:53 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 5 Mar 2020 15:24:52 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 5 Mar 2020 15:24:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 025LOqhX006426;
	Thu, 5 Mar 2020 15:24:52 -0600
Date: Thu, 5 Mar 2020 16:24:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20200305212452.GK1628@beryl>
References: <1583358315-5293-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1583358315-5293-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus/master][PATCH] open62541: upgrade to version 1.0.1, other fixes
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
X-List-Received-Date: Thu, 05 Mar 2020 21:26:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Jake,

Somehow this update has a really hard time getting built - it failed in the 
same place with what looks like an our-of-memory error:

| src_generated/open62541/namespace0_generated.c: In function ‘namespace0_generated’:
| src_generated/open62541/namespace0_generated.c:113178:15: note: variable tracking size limit exceeded with ‘-fvar-tracking-assignments’, retrying without
| 113178 | UA_StatusCode namespace0_generated(UA_Server *server) {
|        |               ^
| arm-none-linux-gnueabihf-gcc: fatal error: Killed signal terminated program lto1
| compilation terminated.
| lto-wrapper: fatal error: /opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-gcc returned 1 exit status
| compilation terminated.
| /opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld: error: lto-wrapper failed

It was not specific to any platform or a build node - all platforms on all 
build nodes have failed. I had to revert the update for now, as I needed to 
release rc3 very quickly.

Has this been tested? Any comments?

-- 
Denys


On Wed, Mar 04, 2020 at 04:45:15PM -0500, Jacob Stiffler wrote:
> * Update SRCREVs to version 1.0.1.
>   - drop 0001-tests-fix-typing-of-size_t-in-printf.patch as it has
>     been resolved upstream.
> * Fix destsuffix of submodules.
> * Enable encryption and default self-signed certificate for testing.
> * Enable full namespace 0
>   - This is required to utilize other official information models.
> * Move unit tests to use PACKAGECONFIG.
>   - Diable for now as the build is broken due to missing dependency
>     libsubunit.
>   - Make installation conditional on PACKAGECONFIG.
> * Move tools to dev package, and RDEPENDS on python3 as they contain
>   python scripts.
>   - This is a bit messy with recipes that depend on open62541, as they
>     will be executing the tools from the target package, but this
>     works as they are python scripts. However, dependent recipes will
>     also need to depend on python3-native.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../open62541/open62541_git.bb                     | 55 +++++++++++-----------
>  1 file changed, 28 insertions(+), 27 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
> index 89c102c..bcdeb32 100644
> --- a/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
> +++ b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
> @@ -5,36 +5,28 @@ LICENSE = "MPL-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
>  
>  SRC_URI = "git://github.com/open62541/open62541.git;protocol=https;branch=${BRANCH} \
> -           git://github.com/OPCFoundation/UA-Nodeset.git;protocol=https;branch=v1.04;destsuffix=deps/ua-nodeset;name=ua-nodeset \
> -           git://github.com/Pro/mdnsd.git;protocol=https;branch=master;destsuffix=deps/mdnsd;name=mdnsd \
> +           git://github.com/OPCFoundation/UA-Nodeset.git;protocol=https;branch=v1.04;destsuffix=git/deps/ua-nodeset;name=ua-nodeset \
> +           git://github.com/Pro/mdnsd.git;protocol=https;branch=master;destsuffix=git/deps/mdnsd;name=mdnsd \
>             file://0001-examples-client-allow-configurable-server.patch \
> -           file://0001-tests-fix-typing-of-size_t-in-printf.patch"
> +"
>  
> -BRANCH = "master"
> -SRCREV = "7ea5a142bac44d5de7554938360e431d34fe2f59"
> +BRANCH = "1.0"
> +SRCREV = "e4309754fc2f6ea6508b59ca82e08c27b0118d74"
>  
> -SRCREV_ua-nodeset = "5bbf784e9376f7230098149dc0218f318a48d630"
> -SRCREV_mdnsd = "9e953b8e4c54d50ba0e174f1e98cfca18f933126"
> +SRCREV_ua-nodeset = "0777abd1bc407b4dbd79abc515864f8c3ce6812b"
> +SRCREV_mdnsd = "f7f0dd543f12fa7bbf2b667cceb287b9c8184b7d"
>  
>  SRCREV_FORMAT = "default"
>  
> -PV = "0.4-dev+git${SRCPV}"
> +PV = "1.0.1+git${SRCPV}"
>  
>  inherit cmake python3native
>  
> -DEPENDS += "python3-six-native libcheck"
> +DEPENDS += "python3-six-native"
>  
>  S = "${WORKDIR}/git"
>  
> -EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DUA_BUILD_EXAMPLES=1 -DUA_BUILD_UNIT_TESTS=1"
> -
> -# Disable BUILD_OPTIMIZATION as unittests fail due to "strict-overflow"
> -DEBUG_BUILD = "1"
> -BUILD_OPTIMIZATION = ""
> -EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Debug"
> -
> -# Or disable unittests
> -#EXTRA_OECMAKE += "-DUA_BUILD_UNIT_TESTS=0"
> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DUA_NAMESPACE_ZERO=FULL -DUA_BUILD_EXAMPLES=1"
>  
>  PACKAGECONFIG[sharedlibs] = "-DBUILD_SHARED_LIBS=1,-DBUILD_SHARED_LIBS=0,,"
>  PACKAGECONFIG[encrypt] = "-DUA_ENABLE_ENCRYPTION=1 -DMBEDTLS_FOLDER_LIBRARY=${STAGING_LIBDIR} -DMBEDTLS_FOLDER_INCLUDE=${STAGING_INCDIR},-DUA_ENABLE_ENCRYPTION=0,mbedtls,"
> @@ -44,11 +36,14 @@ PACKAGECONFIG[pubsub_delta_frames] = "-DUA_ENABLE_PUBSUB_DELTAFRAMES=1,-DUA_ENAB
>  PACKAGECONFIG[pubsub_informationmodel] = "-DUA_ENABLE_PUBSUB_INFORMATIONMODEL=1,-DUA_ENABLE_PUBSUB_INFORMATIONMODEL=0,,"
>  PACKAGECONFIG[pubsub_informationmodel_methods] = "-DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=1,-DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=0,,"
>  PACKAGECONFIG[subscription_events] = "-DUA_ENABLE_SUBSCRIPTIONS_EVENTS=1,-DUA_ENABLE_SUBSCRIPTIONS_EVENTS=0,,"
> -
>  PACKAGECONFIG[certificate] = "-DUA_BUILD_SELFSIGNED_CERTIFICATE=1,-DUA_BUILD_SELFSIGNED_CERTIFICATE=0,,"
>  
> +# This is broken due to missing libsubunit dependency. Keep here in case it becomes available.
> +PACKAGECONFIG[unit_tests] = "-DUA_BUILD_UNIT_TESTS=1,-DUA_BUILD_UNIT_TESTS=0,libcheck libsubunit,"
> +
>  PACKAGECONFIG ?= "pubsub pubsub_delta_frames pubsub_informationmodel \
> -                  pubsub_informationmodel_methods pubsub_uadp"
> +                  pubsub_informationmodel_methods pubsub_uadp encrypt \
> +                  certificate"
>  
>  # Install examples and unit tests
>  do_install_append() {
> @@ -59,19 +54,25 @@ do_install_append() {
>          install -m 755 "$example" "${D}${datadir}/${BPN}/examples"
>      done
>  
> -    # Install unittests
> -    install -d "${D}${datadir}/${BPN}/tests"
> -    for test in ${B}/bin/tests/*
> -    do
> -        install -m 755 "$test" "${D}${datadir}/${BPN}/tests"
> -    done
> +    if ${@bb.utils.contains('PACKAGECONFIG','unit_tests','true','false',d)}
> +    then
> +        # Install unittests
> +        install -d "${D}${datadir}/${BPN}/tests"
> +        for test in ${B}/bin/tests/*
> +        do
> +            install -m 755 "$test" "${D}${datadir}/${BPN}/tests"
> +        done
> +    fi
>  }
>  
>  PACKAGES =+ "${PN}-examples ${PN}-tests"
> -FILES_${PN}-dev += "${libdir}/cmake/*"
> +FILES_${PN}-dev += "${libdir}/cmake/* ${datadir}/${BPN}/tools"
>  FILES_${PN}-examples += "${datadir}/${BPN}/examples"
>  FILES_${PN}-tests += "${datadir}/${BPN}/tests"
>  
> +# This contains some python-based tools
> +RDEPENDS_${PN}-dev = "python3"
> +
>  # Allow staticdev package to be empty incase sharedlibs is switched on
>  ALLOW_EMPTY_${PN}-staticdev = "1"
>  ALLOW_EMPTY_${PN}-tests = "1"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

