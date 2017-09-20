Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id B1C7252990
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 15:46:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KFkBsh013779
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505922371;
	bh=OhmQMXj8/J/sQwnmTbXpsSatqAl/PuD9zGMAglGL8Cc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=CSXC7JIWwFzVNk1OJ3+HI7aPJqLnlLbx927FKdQnthUUBlRZSHBAphj4dQAi8nKIj
	Z3sBhn61Prs/lowoQZZPWXxUWlpvBMeN+e+jKfZRTQX7nDUs1PJi5vSgPv6MpJgZjU
	VlKJVaOyzxCzg6IgqfdwuuCyEhSSjWgWi0AJaMwc=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFkBlp013976
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:46:11 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 10:46:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 10:46:11 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFkAAj027856;
	Wed, 20 Sep 2017 10:46:11 -0500
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>, "Gou, Hongmei"
	<h-gou@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <1505918341-15928-1-git-send-email-a0271529@ti.com>
	<e2b26ef7-9497-f6c7-0345-7e6ddf73f374@ti.com>
	<5130E41A1BA9D145BA0F3B18D5CFB0A7437F67E5@DFLE12.ent.ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <3e841243-7748-473a-a520-d4732c77944d@ti.com>
Date: Wed, 20 Sep 2017 11:46:10 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F67E5@DFLE12.ent.ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH] icss-emac-lld*: update to version 01.00.00.08
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
X-List-Received-Date: Wed, 20 Sep 2017 15:46:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/20/2017 11:42 AM, Radhakrishnan, Mahesh wrote:
> Jake,
>   For the RTOS recipe,  can we apply the below meta-ti patch (under review) which has addressed the review comments ?
> http://patchwork.dal.design.ti.com/patch/32325/

We will still need to bump the version to 1.0.0.8.

>
> Regards
> Mahesh
>
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Wednesday, September 20, 2017 11:40 AM
> To: Gou, Hongmei; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [EXTERNAL] [meta-processor-sdk] [PATCH] icss-emac-lld*: update to version 01.00.00.08
>
>
>
> On 9/20/2017 10:39 AM, Hongmei Gou wrote:
>> * Add icss-emac-lld-rtos to build firmware binaries
>> * Add k2g support for linux user space
>> * Cleanup to remove TARGET from oe_runmake
>>
>> Signed-off-by: Hongmei Gou <a0271529@ti.com>
>> ---
>>    .../icss-emac-lld/icss-emac-lld-01.00.00.inc       |  6 ++--
>>    .../icss-emac-lld/icss-emac-lld-rtos_git.bb        | 28 ++++++++++++++++++
>>    .../icss-emac-lld/icss-emac-lld-test_git.bb        | 34 +++++++++++++---------
>>    recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb     |  5 ++--
>>    4 files changed, 54 insertions(+), 19 deletions(-)
>>    create mode 100644
>> recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
>>
>> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
>> b/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
>> index 8e2ffd4..621219b 100644
>> --- a/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
>> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
>> @@ -9,14 +9,14 @@ ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
>>    ICSS_EMAC_LLD_GIT_BRANCH = "master"
>>    ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
>>    
>> -# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.07C"
>> -ICSS_EMAC_LLD_SRCREV = "08cb0540eeab7721fe82b603cb6285393f314117"
>> +# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.08"
>> +ICSS_EMAC_LLD_SRCREV = "e689df18417236110590f7b290525a610d63f574"
>>    
>>    BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
>>    SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>>    
>>    SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
>> -PV = "01.00.00.07C"
>> +PV = "01.00.00.08"
>>    INC_PR = "r0"
>>    
>>    S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
>> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
>> b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
>> new file mode 100644
>> index 0000000..06ee279
>> --- /dev/null
>> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
>> @@ -0,0 +1,28 @@
>> +inherit ti-pdk
>> +require icss-emac-lld-01.00.00.inc
>> +
>> +PR = "${INC_PR}.0"
>> +
>> +DEPENDS_append = " osal-rtos \
>> +                   pruss-lld-rtos \
>> +"
>> +DEPENDS_append_ti33x = " starterware-rtos \ "
>> +DEPENDS_append_ti43x = " starterware-rtos \ "
>> +
>> +# Build with make instead of XDC
>> +TI_PDK_XDCMAKE = "0"
>> +
>> +LIMSOCS_ti33x = "am335x"
>> +LIMSOCS_ti43x = "am437x"
>> +LIMSOCS_am57xx-evm = "am571x am572x"
>> +LIMSOCS_k2g = "k2g"
> The LIMIT_SOCS are not used by the ti-pdk.bbclass anymore. See http://arago-project.org/git/?p=meta-ti.git;a=commitdiff;h=b00044c43e7785decb1d6ac35349ca4b2711676e
>
> The correct variables are set in the machine configuration, so they can be removed from there.
>
>> +
>> +export PDK_ICSS_EMAC_ROOT_PATH ="${WORKDIR}/build"
>> +export DEST_ROOT="${S}"
>> +
>> +# HTML doc link params
>> +PDK_COMP_LINK_TEXT = "ICSS-EMAC LLD"
>> +
>> +INSANE_SKIP_${PN} = "arch"
>> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
>> b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
>> index 6beafbf..375bfbc 100644
>> --- a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
>> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
>> @@ -1,47 +1,55 @@
>>    DESCRIPTION = "TI ICSS-EMAC low level driver tests"
>>    
>> -DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal"
>> +DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal ti-pdk-build-rtos icss-emac-lld-rtos"
>>    
>>    DEPENDS_append_ti33x = " starterware"
>>    DEPENDS_append_ti43x = " starterware"
>>    
>>    include icss-emac-lld-01.00.00.inc
>>    
>> -PR = "${INC_PR}.2"
>> +PR = "${INC_PR}.0"
>>    
>> -COMPATIBLE_MACHINE = "am57xx-evm|ti33x|ti43x"
>> -
>> -EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} ICSS_EMAC_SRC_DIR=${S}"
>> +EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PDK_PKG_PATH=${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS_EMAC_SRC_DIR=${S}"
>>    
>>    do_compile_am57xx-evm () {
>>    #   Build the tests
>> -    oe_runmake tests DEVICE="am571x" TARGET="SOC_AM571x"
>> +    oe_runmake tests DEVICE="am571x"
>>        oe_runmake clean
>> -    oe_runmake tests DEVICE="am572x" TARGET="SOC_AM572x"
>> +    oe_runmake tests DEVICE="am572x"
>>    }
>>    
>>    do_compile_ti33x () {
>>    #   Build the tests
>> -    oe_runmake tests DEVICE="am335x" TARGET="SOC_AM335x"
>> +    oe_runmake tests DEVICE="am335x"
>>    }
>>    
>>    do_compile_ti43x () {
>>    #   Build the tests
>> -    oe_runmake tests DEVICE="am437x" TARGET="SOC_AM437x"
>> +    oe_runmake tests DEVICE="am437x"
>> +}
>> +
>> +do_compile_k2g-evm () {
>> +#   Build the tests
>> +    oe_runmake tests DEVICE="k2g"
>>    }
>>    
>>    do_install_am57xx-evm () {
>>    #   Install the binary
>> -    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am571x" TARGET="SOC_AM571x"
>> -    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am572x" TARGET="SOC_AM572x"
>> +    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am571x"
>> +    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am572x"
>>    }
>>    
>>    do_install_ti33x () {
>>    #   Install the binary
>> -    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am335x" TARGET="SOC_AM335x"
>> +    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am335x"
>>    }
>>    
>>    do_install_ti43x () {
>>    #   Install the binary
>> -    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am437x" TARGET="SOC_AM437x"
>> +    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am437x"
>> +}
>> +
>> +do_install_k2g-evm () {
>> +#   Install the binary
>> +    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="k2g"
>>    }
> It appears that this "DEVICE" is an element out of the TI_PDK_LIMIT_SOCS list. If this is true, then these compile and install tasks can be greatly simplified by looping over the TI_PDK_LIMIT_SOCS list.
>
>> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
>> b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
>> index b3be89b..bfa655d 100644
>> --- a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
>> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
>> @@ -4,13 +4,12 @@ DEPENDS="common-csl-ip pruss-lld osal"
>>    
>>    include icss-emac-lld-01.00.00.inc
>>    
>> -PR = "${INC_PR}.2"
>> -
>> -COMPATIBLE_MACHINE = "am57xx-evm|ti33x|ti43x"
>> +PR = "${INC_PR}.0"
>>    
>>    TARGET_NAME_am57xx-evm = "SOC_AM572x"
>>    TARGET_NAME_ti33x = "SOC_AM335x"
>>    TARGET_NAME_ti43x = "SOC_AM437x"
>> +TARGET_NAME_k2g-evm = "SOC_K2G"
>>    
>>    EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} TARGET=${TARGET_NAME}"
>>    
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


