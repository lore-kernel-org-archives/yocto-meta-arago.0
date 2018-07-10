Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 23A52529D5
	for <meta-arago@arago-project.org>;
	Tue, 10 Jul 2018 19:43:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6AJhJEP071755
	for <meta-arago@arago-project.org>; Tue, 10 Jul 2018 14:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531251799;
	bh=FxP0jyKCWcCTKMB43UjVKAKRjkfXLlddpby2zXR1xN0=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=FzpgQXai0Cr1Rm5HMuMAPpA1PVrRhqMO42/BLbTATrwHAikcPbP3VMTRXNekARfSt
	qSI6cjFxe3a1NAlkfB4tQpvd0Rhw+zVfBb5g90XAoz1WI/HldwOjU2oGD9m16mT7qR
	Cd56WCkOTWvV95LRm+lcim2FAQyShYVSW9k59Vjo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6AJhJWH029246
	for <meta-arago@arago-project.org>; Tue, 10 Jul 2018 14:43:19 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 10 Jul 2018 14:43:18 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 10 Jul 2018 14:43:18 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6AJhIRu021483;
	Tue, 10 Jul 2018 14:43:18 -0500
To: "Zhao, Yuan" <yuanzhao@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
References: <20180710191209.145987-1-yuanzhao@ti.com>
	<a02dff49-c0f9-43a2-0c37-f258a4221da5@ti.com>
	<74516d8e6e6b4008a58027945b6a8988@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <5942fe30-b8db-e741-a233-6d458ddc4b7d@ti.com>
Date: Tue, 10 Jul 2018 15:43:18 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <74516d8e6e6b4008a58027945b6a8988@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH v3] tidl-api: update to version 01.00.00.02
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
X-List-Received-Date: Tue, 10 Jul 2018 19:43:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/10/2018 3:39 PM, Zhao, Yuan wrote:
>> +SRCIPK_SRC_DIR = "${S}/examples"
> Okay, how do I reference this directory in arago-source-ipk.inc?  ${S} is not available, right?  What about ${WORKDIR}?

These variables have, I guess you would call it, late expansion. So it 
is safe to use "${S}" just how "${PN} and "${PV}" are used in the other 
variables.

In the common include file, you will only need to make sure you include 
the "_pn-tidl-examples" suffix similar to the other configuration.

> - Yuan
>
> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Tuesday, July 10, 2018 2:27 PM
> To: Zhao, Yuan; meta-arago@arago-project.org
> Subject: Re: [EXTERNAL] [meta-arago] [PATCH v3] tidl-api: update to version 01.00.00.02
>
>
>
> On 7/10/2018 3:12 PM, Yuan Zhao wrote:
>> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
>> ---
>>    .../conf/distro/include/arago-source-ipk.inc       |  3 ++
>>    meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc |  4 +-
>>    .../recipes-ti/tidl-api/tidl-api_git.bb            | 54 ++++++++++++++++++++++
>>    .../recipes-ti/tidl-api/tidl-examples_git.bb       | 32 +++++++------
>>    4 files changed, 78 insertions(+), 15 deletions(-)
>>    create mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
>>
>> diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
>> index 5e3de4ef..876c1258 100644
>> --- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
>> +++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
>> @@ -329,6 +329,9 @@ SRCIPK_INSTALL_DIR_pn-opencl-examples = "example-applications/${PN}-${PV}"
>>    CREATE_SRCIPK_pn-openmpacc-examples = "1"
>>    SRCIPK_INSTALL_DIR_pn-openmpacc-examples = "example-applications/${PN}-${PV}"
>>    
>> +CREATE_SRCIPK_pn-tidl-examples = "1"
>> +SRCIPK_INSTALL_DIR_pn-tidl-examples = "example-applications/${PN}-${PV}"
>> +
>>    CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded = "1"
>>    SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded = "example-applications/${PN}-${PV}"
>>    
>> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
>> index d266611c..d2b570d1 100644
>> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
>> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
>> @@ -1,4 +1,4 @@
>> -PV = "1.0.0.0"
>> +PV = "1.0.0.2"
>>    INC_PR = "r0"
>>    
>>    LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=ae816cc40db02fe06193212437ad00e8"
>> @@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
>>    BRANCH = "master"
>>    
>>    SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
>> -SRCREV = "d6326ad29c9ed4b79ebf3e0f588f247ed2cf3d2e"
>> +SRCREV = "8bad8d86fd89fd8c482aa10ab89f3049337a9ca2"
>> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
>> new file mode 100644
>> index 00000000..9c41ef11
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
>> @@ -0,0 +1,54 @@
>> +SUMMARY = "TIDL API"
>> +DESCRIPTION = "TIDL API header and library. Refer TIDL API User's Guide for details."
>> +HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
>> +LICENSE = "BSD"
>> +
>> +include tidl-api.inc
>> +require recipes-ti/includes/ti-paths.inc
>> +
>> +PR = "${INC_PR}.0"
>> +
>> +COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +DEPENDS = "opencv \
>> +           opencl \
>> +           opencl-monitor \
>> +           ti-cgt6x-native \
>> +           clocl-native \
>> +"
>> +
>> +RDEPENDS_${PN} += "opencl-runtime \
>> +                   opencv \
>> +"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +EXTRA_OEMAKE = " -C ${S}/tidl_api \
>> +                 TARGET_ROOTDIR=${STAGING_DIR_HOST} \
>> +                 TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
>> +"
>> +
>> +do_compile() {
>> +  oe_runmake
>> +}
>> +
>> +CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>> +
>> +TIDL_INSTALL_DIR = "${datadir}/ti/tidl"
>> +
>> +do_install() {
>> +    install -d ${D}${TIDL_INSTALL_DIR}
>> +    install -d ${D}${TIDL_INSTALL_DIR}/tidl_api
>> +    install -d ${D}${TIDL_INSTALL_DIR}/viewer
>> +    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${TIDL_INSTALL_DIR}/tidl_api/
>> +    cp ${CP_ARGS} ${S}/viewer/* ${D}${TIDL_INSTALL_DIR}/viewer/
>> +    install ${S}/readme.md ${D}${TIDL_INSTALL_DIR}/
>> +}
>> +
>> +FILES_${PN} += "\
>> +    ${TIDL_INSTALL_DIR} \
>> +"
>> +
>> +
>> +INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
>> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
>> index be9bb65f..47b7ac40 100644
>> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
>> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
>> @@ -1,5 +1,5 @@
>> -SUMMARY = "TIDL API and examples"
>> -DESCRIPTION = "TIDL API and examples of API usage. Refer TIDL API User's Guide for details."
>> +SUMMARY = "TIDL API examples"
>> +DESCRIPTION = "Examples of TIDL API. Refer TIDL API User's Guide for details."
>>    HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
>>    LICENSE = "BSD"
>>    
>> @@ -11,9 +11,16 @@ PR = "${INC_PR}.0"
>>    COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
>>    PACKAGE_ARCH = "${MACHINE_ARCH}"
>>    
>> -DEPENDS = "opencv opencl opencl-monitor ti-cgt6x-native clocl-native"
>> +DEPENDS = "opencv \
>> +           clocl-native \
>> +           ti-cgt6x-native \
>> +           tidl-api \
>> +"
>>    
>> -RDEPENDS_${PN} += " opencl-runtime opencv"
>> +RDEPENDS_${PN} += "tidl-api \
>> +                   opencl-runtime \
>> +                   opencv \
>> +"
>>    
>>    S = "${WORKDIR}/git"
>>    
>> @@ -28,20 +35,19 @@ do_compile() {
>>    
>>    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>>    
>> +TIDL_INSTALL_DIR = "${datadir}/ti/tidl"
>> +
>>    do_install() {
>> -    install -d ${D}${datadir}/ti/tidl-api
>> -    install -d ${D}${datadir}/ti/tidl-api/examples
>> -    install -d ${D}${datadir}/ti/tidl-api/tidl_api
>> -    install -d ${D}${datadir}/ti/tidl-api/viewer
>> -    cp ${CP_ARGS} ${S}/examples/* ${D}${datadir}/ti/tidl-api/examples/
>> -    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${datadir}/ti/tidl-api/tidl_api/
>> -    cp ${CP_ARGS} ${S}/viewer/* ${D}${datadir}/ti/tidl-api/viewer/
>> -    install ${S}/readme.md ${D}${datadir}/ti/tidl-api/
>> +    install -d ${D}${TIDL_INSTALL_DIR}
>> +    install -d ${D}${TIDL_INSTALL_DIR}/examples
>> +    cp ${CP_ARGS} ${S}/examples/* ${D}${TIDL_INSTALL_DIR}/examples/
>>    }
>>    
>>    FILES_${PN} += "\
>> -    ${datadir}/ti/tidl-api \
>> +    ${TIDL_INSTALL_DIR} \
>>    "
>>    
>>    
>>    INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
>> +
>> +SRCIPK_SRC_DIR = "${S}/examples"
> This SRCIPK_SRC_DIR should also go into the arago-source-ipk.inc
>


