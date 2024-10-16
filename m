Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0340D2A556
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:37:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.32639.1729107461869953335
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 12:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qXlsAHj7;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49GJbdih090391;
	Wed, 16 Oct 2024 14:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729107459;
	bh=F/71NWb7MbyTDtQSUG1CB2kZ2fVjbj58CYP5z+2UqL0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=qXlsAHj7ErcsVznH+zSZEO1BZRtWXw4wnSqLFZNeI8XkbAPNfxC0iCVR3XOOFiBST
	 2t1xHhYHQwowh0/EXbuFfIZ+Eu/K0gJt2onLblP8+oUlslV26lNTxcubQVORs3C1H3
	 WIY0XnQMw3crfn5tUh+kDiIRZOzFs1WtHrg5gCUE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49GJbdIn012296
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Oct 2024 14:37:39 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Oct 2024 14:37:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Oct 2024 14:37:39 -0500
Received: from [10.249.35.83] ([10.249.35.83])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49GJbdc2049108;
	Wed, 16 Oct 2024 14:37:39 -0500
Message-ID: <5c72513d-9517-4cee-8157-4bdba1471145@ti.com>
Date: Wed, 16 Oct 2024 14:37:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [oe-layersetup][master][RFC] src: New XML/XSLT
 generation of config files.
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <17FF05F3273023DB.9153@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17FF05F3273023DB.9153@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 16 Oct 2024 19:37:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15576


For anyone interested in seeing the result of these changes you can 
check out the wip branch.

https://git.ti.com/cgit/arago-project/oe-layersetup/log/?h=wip

There are three total patches, but this is the only patch that I'm 
sending to the mailing list due to the size of the other two patches.

The second patch populates the new XML config files.  The third patch 
uses the new XML configs to generate all of the kas and bitbake-setup 
configs.


On 10/16/2024 2:35 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> In an attempt to meet the needs of our various customers that are using
> other layer setup tools, we are going to start providing our configs in
> existing oe-layersetup, kas, and the upcoming bitbake-setup formats as
> well.
> 
> This will be accomplished by storing the config information in XML
> format and using XSLT to generate all of the other formats so that they
> all align with the same layers, branches, etc...
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   README                                    |  39 ++
>   conf/layer.conf                           |   3 +
>   src/Makefile                              | 284 +++++++++++++++
>   src/bin/check.pl                          |  16 +
>   src/bin/convert.pl                        | 412 ++++++++++++++++++++++
>   src/common/motd_cicd.xml                  |   9 +
>   src/common/targets_arago.xml              |   8 +
>   src/common/targets_poky.xml               |   3 +
>   src/xslt/bitbake-setup-bblayers-conf.xslt |  45 +++
>   src/xslt/bitbake-setup-conf-notes.xslt    |  32 ++
>   src/xslt/bitbake-setup-conf-summary.xslt  |   9 +
>   src/xslt/bitbake-setup-local-conf.xslt    |  34 ++
>   src/xslt/bitbake-setup.xslt               |  72 ++++
>   src/xslt/kas-templates.xslt               |  38 ++
>   src/xslt/kas.xslt                         |  70 ++++
>   src/xslt/oe-layersetup-templates.xslt     |  25 ++
>   src/xslt/oe-layersetup.xslt               |  75 ++++
>   17 files changed, 1174 insertions(+)
>   create mode 100644 README
>   create mode 100644 conf/layer.conf
>   create mode 100644 src/Makefile
>   create mode 100755 src/bin/check.pl
>   create mode 100755 src/bin/convert.pl
>   create mode 100644 src/common/motd_cicd.xml
>   create mode 100644 src/common/targets_arago.xml
>   create mode 100644 src/common/targets_poky.xml
>   create mode 100644 src/xslt/bitbake-setup-bblayers-conf.xslt
>   create mode 100644 src/xslt/bitbake-setup-conf-notes.xslt
>   create mode 100644 src/xslt/bitbake-setup-conf-summary.xslt
>   create mode 100644 src/xslt/bitbake-setup-local-conf.xslt
>   create mode 100644 src/xslt/bitbake-setup.xslt
>   create mode 100644 src/xslt/kas-templates.xslt
>   create mode 100644 src/xslt/kas.xslt
>   create mode 100644 src/xslt/oe-layersetup-templates.xslt
>   create mode 100644 src/xslt/oe-layersetup.xslt
> 
> diff --git a/README b/README
> new file mode 100644
> index 0000000..040d308
> --- /dev/null
> +++ b/README
> @@ -0,0 +1,39 @@
> +
> +The oe-layersetup repository was created by Texas Instruments back in 2012
> +as both a tool for configuring OpenEmbedded builds and the place to house
> +the configuration files for rebuilding all of the releases of our software.
> +It pre-dates most of the other tools by several years and has been in active
> +use by TI's customers since its creation both directly and indirectly as
> +we use these configs to drive our build processes for our TISDK packages
> +on ti.com.
> +
> +The oe-layersetup script has some useful features that include:
> +
> +  - Specifying the git repositories, branch, and commit on the branch you
> +    want to configure the build for.
> +  - The layers in the repository that you want to include in the build.
> +  - A set of templates to use in the creation of the bblayers.conf and
> +    the local.conf.
> +  - A message of the day feature that can print a block of text to the
> +    screen when running the tool against a config file.
> +  - Custom local.conf settings that you need to include for the build you
> +    are setting up.
> +
> +With the creation and rise in popularity of some of the newer tools, including
> +the upcoming bitbake-setup tool, it is time to broaden our support for our
> +build configuration into some of these other newer tools.
> +
> +To that end, we have migrated all of our configurations into an XML format
> +that serves to capture all of the bits of information that the different tools
> +need.  Additionally, we have created a Makefile and XSLT files that can
> +generate the various configuration files for oe-layersetup, kas, and
> +bitbake-setup.
> +
> +If you want to add a new configuration, you need to create the appropriate XML
> +file in src/configs, run make in src, and then commit all of the new files.
> +
> +- cd src
> +- Edit configs/.../config.xml
> +- make
> +- git status
> +
> diff --git a/conf/layer.conf b/conf/layer.conf
> new file mode 100644
> index 0000000..4997038
> --- /dev/null
> +++ b/conf/layer.conf
> @@ -0,0 +1,3 @@
> +BBFILE_COLLECTIONS += "oe-layersetup"
> +LAYERVERSION_oe-layersetup = "1"
> +LAYERSERIES_COMPAT_oe-layersetup = "kirkstone scarthgap styhead walnascar"
> diff --git a/src/Makefile b/src/Makefile
> new file mode 100644
> index 0000000..f71283a
> --- /dev/null
> +++ b/src/Makefile
> @@ -0,0 +1,284 @@
> +
> +SRC_CONFIGS := $(shell find configs -name "*.xml")
> +SRC_TEMPLATES := $(shell find templates -name "*.xml")
> +
> +TGT_OE_LAYERSETUP_CONFIGS = $(patsubst configs/%,../configs/%,$(patsubst %.xml,%.txt,$(SRC_CONFIGS)))
> +TGT_OE_LAYERSETUP_TEMPLATES = $(patsubst templates/%,../sample-files/%,$(patsubst %.xml,%.sample,$(SRC_TEMPLATES)))
> +
> +TGT_KAS_CONFIGS = $(patsubst configs/%,../kas/%,$(patsubst %.xml,%.yml,$(SRC_CONFIGS)))
> +TGT_KAS_TEMPLATES = $(patsubst templates/%,../kas/templates/%,$(patsubst %.xml,%.yml,$(SRC_TEMPLATES)))
> +
> +TMP_BITBAKE_SETUP_FLATTENED_CONFIGS = $(subst /,_,$(patsubst configs/%,%,$(SRC_CONFIGS)))
> +
> +TGT_BITBAKE_SETUP_CONFIGS = $(patsubst %,../bitbake-setup/%,$(patsubst %.xml,%.json,$(TMP_BITBAKE_SETUP_FLATTENED_CONFIGS)))
> +TGT_BITBAKE_SETUP_TEMPLATES_BBLAYERS_CONF = $(patsubst %,../conf/templates/%,$(patsubst %.xml,%/bblayers.conf.sample,$(TMP_BITBAKE_SETUP_FLATTENED_CONFIGS)))
> +TGT_BITBAKE_SETUP_TEMPLATES_CONF_NOTES = $(patsubst %,../conf/templates/%,$(patsubst %.xml,%/conf-notes.txt,$(TMP_BITBAKE_SETUP_FLATTENED_CONFIGS)))
> +TGT_BITBAKE_SETUP_TEMPLATES_CONF_SUMMARY = $(patsubst %,../conf/templates/%,$(patsubst %.xml,%/conf-summary.txt,$(TMP_BITBAKE_SETUP_FLATTENED_CONFIGS)))
> +TGT_BITBAKE_SETUP_TEMPLATES_LOCAL_CONF = $(patsubst %,../conf/templates/%,$(patsubst %.xml,%/local.conf.sample,$(TMP_BITBAKE_SETUP_FLATTENED_CONFIGS)))
> +TGT_BITBAKE_SETUP_TEMPLATES = $(TGT_BITBAKE_SETUP_TEMPLATES_BBLAYERS_CONF) \
> +							  $(TGT_BITBAKE_SETUP_TEMPLATES_CONF_NOTES) \
> +							  $(TGT_BITBAKE_SETUP_TEMPLATES_CONF_SUMMARY) \
> +							  $(TGT_BITBAKE_SETUP_TEMPLATES_LOCAL_CONF)
> +
> +TARGETS = $(TGT_OE_LAYERSETUP_CONFIGS) \
> +		  $(TGT_OE_LAYERSETUP_TEMPLATES) \
> +		  $(TGT_KAS_CONFIGS) \
> +		  $(TGT_KAS_TEMPLATES) \
> +		  $(TGT_BITBAKE_SETUP_CONFIGS) \
> +		  $(TGT_BITBAKE_SETUP_TEMPLATES)
> +
> +all: $(TARGETS)
> +
> +clean:
> +	@echo "  CLEAN ../kas"; rm -rf ../kas
> +	@echo "  CLEAN ../bitbake-setup"; rm -rf ../bitbake-setup
> +	@echo "  CLEAN ../conf/templates"; rm -rf ../conf/templates
> +
> +vars:
> +	@echo "Source"
> +	@echo "-------------------------"
> +	@echo "SRC_CONFIGS = $(SRC_CONFIGS)"
> +	@echo "SRC_TEMPLATES = $(SRC_TEMPLATES)"
> +	@echo ""
> +	@echo "oe-layersetup"
> +	@echo "-------------------------"
> +	@echo "TGT_OE_LAYERSETUP_CONFIGS = $(TGT_OE_LAYERSETUP_CONFIGS)"
> +	@echo "TGT_OE_LAYERSETUP_TEMPLATES = $(TGT_OE_LAYERSETUP_TEMPLATES)"
> +	@echo ""
> +	@echo "kas"
> +	@echo "-------------------------"
> +	@echo "TGT_KAS_CONFIGS = $(TGT_KAS_CONFIGS)"
> +	@echo "TGT_KAS_TEMPLATES = $(TGT_KAS_TEMPLATES)"
> +	@echo ""
> +	@echo "bitbake-setup"
> +	@echo "-------------------------"
> +	@echo "TGT_BITBAKE_SETUP_CONFIGS = $(TGT_BITBAKE_SETUP_CONFIGS)"
> +	@echo "TGT_BITBAKE_SETUP_TEMPLATES = $(TGT_BITBAKE_SETUP_TEMPLATES)"
> +	@echo ""
> +	@echo "Targets"
> +	@echo "-------------------------"
> +	@echo "TARGETS = $(TARGETS)"
> +
> +#------------------------------------------------------------------------------
> +# OE-LayerSetup
> +#------------------------------------------------------------------------------
> +define xslt_oe_layersetup =
> +	mkdir -p $(@D); \
> +	echo "  XLST oe-layersetup $*"; \
> +	xsltproc --xinclude $^ > $@
> +endef
> +
> +define xslt_oe_layersetup_templates =
> +	mkdir -p $(@D); \
> +	echo "  XLST oe-layersetup-templates $*"; \
> +	xsltproc --xinclude $^ > $@
> +endef
> +
> +../configs/%.txt: xslt/oe-layersetup.xslt configs/%.xml
> +	@$(xslt_oe_layersetup)
> +
> +../sample-files/%.sample: xslt/oe-layersetup-templates.xslt templates/%.xml
> +	@$(xslt_oe_layersetup_templates)
> +
> +#------------------------------------------------------------------------------
> +# KAS
> +#------------------------------------------------------------------------------
> +define xslt_kas =
> +	mkdir -p $(@D); \
> +	echo "  XLST kas $*"; \
> +	xsltproc --stringparam arTemplatePrefix $$loTemplatePrefix --xinclude $^ > $@
> +endef
> +
> +define xslt_kas_templates =
> +	mkdir -p $(@D); \
> +	echo "  XLST kas-templates $*"; \
> +	xsltproc --stringparam arTemplatePrefix $$loTemplatePrefix --xinclude $^ > $@
> +endef
> +
> +../kas/%.yml: xslt/kas.xslt configs/%.xml
> +	@loTemplatePrefix1=`realpath --relative-to configs/$*.xml .`; \
> +	loTemplatePrefix2=`dirname $${loTemplatePrefix1}`; \
> +	loTemplatePrefix=`dirname $${loTemplatePrefix2}`; \
> +	$(xslt_kas)
> +
> +../kas/templates/%.yml: xslt/kas-templates.xslt templates/%.xml
> +	@$(xslt_kas_templates)
> +
> +#------------------------------------------------------------------------------
> +# Bitbake-setup config.json
> +#------------------------------------------------------------------------------
> +define xslt_bitbake_setup =
> +	mkdir -p $(@D); \
> +	echo "  XLST bitbake-setup $*"; \
> +	xsltproc --stringparam arConfigName $$loConfigName --xinclude $^ > $@
> +endef
> +
> +../bitbake-setup/%.json: xslt/bitbake-setup.xslt configs/%.xml
> +	@loConfigName="$*"; \
> +	$(xslt_bitbake_setup)
> +
> +../bitbake-setup/amsdk_%.json: xslt/bitbake-setup.xslt configs/amsdk/%.xml
> +	@loConfigName="amsdk_$*"; \
> +	$(xslt_bitbake_setup)
> +
> +../bitbake-setup/coresdk_%.json: xslt/bitbake-setup.xslt configs/coresdk/%.xml
> +	@loConfigName="coresdk_$*"; \
> +	$(xslt_bitbake_setup)
> +
> +../bitbake-setup/glsdk_%.json: xslt/bitbake-setup.xslt configs/glsdk/%.xml
> +	@loConfigName="glsdk_$*"; \
> +	$(xslt_bitbake_setup)
> +
> +../bitbake-setup/mcsdk_%.json: xslt/bitbake-setup.xslt configs/mcsdk/%.xml
> +	@loConfigName="mcsdk_$*"; \
> +	$(xslt_bitbake_setup)
> +
> +../bitbake-setup/processor-sdk_%.json: xslt/bitbake-setup.xslt configs/processor-sdk/%.xml
> +	@loConfigName="processor-sdk_$*"; \
> +	$(xslt_bitbake_setup)
> +
> +../bitbake-setup/processor-sdk-analytics_%.json: xslt/bitbake-setup.xslt configs/processor-sdk-analytics/%.xml
> +	@loConfigName="processor-sdk-analytics_$*"; \
> +	$(xslt_bitbake_setup)
> +
> +../bitbake-setup/processor-sdk-linux_%.json: xslt/bitbake-setup.xslt configs/processor-sdk-linux/%.xml
> +	@loConfigName="processor-sdk-linux_$*"; \
> +	$(xslt_bitbake_setup)
> +
> +#------------------------------------------------------------------------------
> +# Bitbake-setup templates
> +#------------------------------------------------------------------------------
> +define xslt_bitbake_setup_templates =
> +	mkdir -p $(@D); \
> +	echo "  XLST bitbake-setup-templates $*"; \
> +	xsltproc --stringparam arConfigName $$loConfigName --xinclude $^ > $@
> +endef
> +
> +../conf/templates/%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/%.xml
> +	@loConfigName="$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/amsdk_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/amsdk/%.xml
> +	@loConfigName="amsdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/coresdk_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/coresdk/%.xml
> +	@loConfigName="coresdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/glsdk_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/glsdk/%.xml
> +	@loConfigName="glsdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/mcsdk_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/mcsdk/%.xml
> +	@loConfigName="mcsdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/processor-sdk_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/processor-sdk/%.xml
> +	@loConfigName="processor-sdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/processor-sdk-analytics_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/processor-sdk-analytics/%.xml
> +	@loConfigName="processor-sdk-analytics_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/processor-sdk-linux_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/processor-sdk-linux/%.xml
> +	@loConfigName="processor-sdk-linux_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/%.xml
> +	@loConfigName="$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/amsdk_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/amsdk/%.xml
> +	@loConfigName="amsdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/coresdk_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/coresdk/%.xml
> +	@loConfigName="coresdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/glsdk_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/glsdk/%.xml
> +	@loConfigName="glsdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/mcsdk_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/mcsdk/%.xml
> +	@loConfigName="mcsdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/processor-sdk_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/processor-sdk/%.xml
> +	@loConfigName="processor-sdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/processor-sdk-analytics_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/processor-sdk-analytics/%.xml
> +	@loConfigName="processor-sdk-analytics_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/processor-sdk-linux_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/processor-sdk-linux/%.xml
> +	@loConfigName="processor-sdk-linux_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/%.xml
> +	@loConfigName="$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/amsdk_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/amsdk/%.xml
> +	@loConfigName="amsdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/coresdk_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/coresdk/%.xml
> +	@loConfigName="coresdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/glsdk_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/glsdk/%.xml
> +	@loConfigName="glsdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/mcsdk_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/mcsdk/%.xml
> +	@loConfigName="mcsdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/processor-sdk_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/processor-sdk/%.xml
> +	@loConfigName="processor-sdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/processor-sdk-analytics_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/processor-sdk-analytics/%.xml
> +	@loConfigName="processor-sdk-analytics_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/processor-sdk-linux_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/processor-sdk-linux/%.xml
> +	@loConfigName="processor-sdk-linux_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/%.xml
> +	@loConfigName="$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/amsdk_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/amsdk/%.xml
> +	@loConfigName="amsdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/coresdk_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/coresdk/%.xml
> +	@loConfigName="coresdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/glsdk_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/glsdk/%.xml
> +	@loConfigName="glsdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/mcsdk_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/mcsdk/%.xml
> +	@loConfigName="mcsdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/processor-sdk_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/processor-sdk/%.xml
> +	@loConfigName="processor-sdk_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/processor-sdk-analytics_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/processor-sdk-analytics/%.xml
> +	@loConfigName="processor-sdk-analytics_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> +../conf/templates/processor-sdk-linux_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/processor-sdk-linux/%.xml
> +	@loConfigName="processor-sdk-linux_$*"; \
> +	$(xslt_bitbake_setup_templates)
> +
> diff --git a/src/bin/check.pl b/src/bin/check.pl
> new file mode 100755
> index 0000000..4b31bbb
> --- /dev/null
> +++ b/src/bin/check.pl
> @@ -0,0 +1,16 @@
> +#!/usr/bin/perl
> +
> +use strict;
> +
> +my @loDiffs = qx( diff -wBrq /scratch/work/oe-layersetup/configs /scratch/work/oe-layersetup/configs2 );
> +
> +foreach my $lpDiff (@loDiffs)
> +{
> +    my ($lpA,$lpB) = ($lpDiff =~ /Files (.+) and (.+) differ/);
> +
> +    if (defined($lpA) && defined($lpB))
> +    {
> +        system("tkdiff -w -B $lpA $lpB");
> +    }
> +}
> +
> diff --git a/src/bin/convert.pl b/src/bin/convert.pl
> new file mode 100755
> index 0000000..9f154a4
> --- /dev/null
> +++ b/src/bin/convert.pl
> @@ -0,0 +1,412 @@
> +#!/usr/bin/perl
> +
> +use strict;
> +
> +#
> +# This is a one-time script to convert the current oe-layersetup configs into
> +# the new XML format.  Current version only converts kirkstone, scarthgap, and
> +# master configs.
> +#
> +# NOTE: Paths are setup for this script to be run in the src/ directory
> +#
> +
> +my %glReferencedBblayersConf;
> +my %glReferencedLocalConf;
> +
> +convert_configs("configs");
> +#convert_templates("../sample-files");
> +
> +foreach my $lpBblayersConf (keys(%glReferencedBblayersConf))
> +{
> +    convert_bblayers_conf_template($lpBblayersConf);
> +}
> +
> +foreach my $lpLocalConf (keys(%glReferencedLocalConf))
> +{
> +    convert_local_conf_template($lpLocalConf);
> +}
> +
> +sub convert_configs
> +{
> +    my $arDir = shift;
> +
> +    #print "convert_configs: $arDir\n";
> +
> +    opendir(DIR, "../${arDir}");
> +    my @loFiles = readdir(DIR);
> +    closedir(DIR);
> +
> +    foreach my $lpFile (sort {$a cmp $b} @loFiles)
> +    {
> +        next if ($lpFile =~ /^\.\.?$/);
> +
> +        #print "convert_configs: check: $arDir/$lpFile\n";
> +
> +        if (-d "../${arDir}/${lpFile}")
> +        {
> +            convert_configs("${arDir}/${lpFile}");
> +        }
> +        elsif ($lpFile =~ /\.txt$/)
> +        {
> +            convert_config("${arDir}/${lpFile}");
> +        }
> +    }
> +}
> +
> +sub convert_config
> +{
> +    my $arFile = shift;
> +
> +    my $loConfigName = $arFile;
> +    $loConfigName =~ s/\.txt$//;
> +    $loConfigName =~ s/configs\///;
> +
> +    my $loTargetFPFN = $arFile;
> +    $loTargetFPFN =~ s/\.txt$/.xml/;
> +
> +    my ($loTargetDir) = ($loTargetFPFN =~ /^(.+?)\/[^\/]+$/);
> +
> +    open(CFG, "../${arFile}");
> +    my @loLines = <CFG>;
> +    close(CFG);
> +
> +    #-------------------------------------------------------------------------
> +    # Check if the config matches the right branches
> +    #-------------------------------------------------------------------------
> +    my $loMatchBranch = 0;
> +    foreach my $lpLine (@loLines)
> +    {
> +        if ($lpLine =~ /meta-ti/)
> +        {
> +            if ($lpLine =~ /(kirkstone|scarthgap|master)/)
> +            {
> +                $loMatchBranch = 1;
> +            }
> +
> +            last;
> +        }
> +    }
> +
> +    if ($loMatchBranch == 0)
> +    {
> +        return;
> +    }
> +
> +    print "convert: ${arFile} -> ${loTargetFPFN}\n";
> +
> +    #-------------------------------------------------------------------------
> +    # Extract the templates so that we can convert them too.
> +    #-------------------------------------------------------------------------
> +    foreach my $lpLine (@loLines)
> +    {
> +        if ($lpLine =~ /^\s*OECORELAYERCONF\s*=\s*(.+?)$/)
> +        {
> +            my $loFile = $1;
> +
> +            $glReferencedBblayersConf{".".$loFile} = 1;
> +        }
> +
> +        if ($lpLine =~ /^\s*OECORELOCALCONF\s*=\s*(.+?)$/)
> +        {
> +            my $loFile = $1;
> +
> +            $glReferencedLocalConf{".".$loFile} = 1;
> +        }
> +    }
> +
> +    system("mkdir -p ${loTargetDir}");
> +
> +    my @loMotd;
> +    my @loLocalConf;
> +
> +    my $loTargets = "arago";
> +
> +    if ($loTargetFPFN =~ /poky/)
> +    {
> +        $loTargets = "poky";
> +    }
> +    elsif ($loTargetFPFN =~ /distroless/)
> +    {
> +        $loTargets = "distroless";
> +    }
> +
> +    my $loDescription = "";
> +
> +    if ($loConfigName =~ /^arago-(.+)-config/)
> +    {
> +        my $loBranch = $1;
> +        $loDescription = "Arago reference distribution for $loBranch";
> +
> +        if ($loBranch =~ /-next$/)
> +        {
> +            $loDescription .= " (CICD)";
> +        }
> +    }
> +    elsif ($loConfigName =~ /^poky-(.+)-config/)
> +    {
> +        my $loBranch = $1;
> +        $loDescription = "Poky reference distribution for $loBranch";
> +    }
> +    elsif ($loConfigName =~ /^distroless-(.+)-config/)
> +    {
> +        my $loBranch = $1;
> +        $loDescription = "Distroless reference for $loBranch";
> +    }
> +    elsif ($loConfigName =~ /^amsdk\/amsdk-(.+)-config/)
> +    {
> +        my $loVersion = $1;
> +        $loDescription = "TI AMSDK v$loVersion";
> +    }
> +    elsif ($loConfigName =~ /^coresdk\/coresdk-(.+)-config/)
> +    {
> +        my $loVersion = $1;
> +        $loDescription = "TI CoreSDK v$loVersion";
> +    }
> +    elsif ($loConfigName =~ /^glsdk\/glsdk-(.+)-config/)
> +    {
> +        my $loVersion = $1;
> +        $loDescription = "TI GLSDK v$loVersion";
> +    }
> +    elsif ($loConfigName =~ /^mcsdk\/mcsdk-(.+)-config/)
> +    {
> +        my $loVersion = $1;
> +        $loDescription = "TI MCSDK v$loVersion";
> +    }
> +    elsif ($loConfigName =~ /^processor-sdk\/processor-sdk(?:-(?:dunfell|kirkstone|kirkstone-chromium|scarthgap|scarthgap-chromium))?-(.+?)(-config)?$/)
> +    {
> +        my $loVersion = $1;
> +        $loDescription = "TI Processor SDK v$loVersion";
> +    }
> +    elsif ($loConfigName =~ /^processor-sdk-analytics\/processor-sdk-analytics-(.+?)(-config)?$/)
> +    {
> +        my $loVersion = $1;
> +        $loDescription = "TI Processor SDK Analytics v$loVersion";
> +    }
> +    elsif ($loConfigName =~ /^processor-sdk-linux\/processor-sdk(?:-(?:linux|gateway))?-(.+?)(-config)?$/)
> +    {
> +        my $loVersion = $1;
> +        $loDescription = "TI Processor SDK Linux v$loVersion";
> +    }
> +
> +    my $loLayerConfTemplate = "";
> +    my $loLocalConfTemplate = "";
> +    my $loBitbakeInclusiveVars = "no";
> +
> +    my %loBitbake;
> +    my @loRepos;
> +
> +    foreach my $lpLine (@loLines)
> +    {
> +        chomp($lpLine);
> +
> +        next if (($lpLine =~ /^#/) && ($lpLine !~/^#\s*meta/));
> +        next if ($lpLine =~ /^\s*$/);
> +
> +        if ($lpLine =~ /^OECORELAYERCONF\s*=\s*\.\/sample-files\/(.+?)$/)
> +        {
> +            $loLayerConfTemplate = $1;
> +            $loLayerConfTemplate =~ s/\.sample$/.xml/;
> +        }
> +        elsif ($lpLine =~ /^OECORELOCALCONF\s*=\s*\.\/sample-files\/(.+?)$/)
> +        {
> +            $loLocalConfTemplate = $1;
> +            $loLocalConfTemplate =~ s/\.sample$/.xml/;
> +        }
> +        elsif ($lpLine =~ /^BITBAKE_INCLUSIVE_VARS\s*=\s*(.+?)$/)
> +        {
> +            $loBitbakeInclusiveVars = $1;
> +        }
> +        elsif ($lpLine =~ /^MOTD:\s*(.+?)$/)
> +        {
> +            push(@loMotd, $1);
> +        }
> +        elsif ($lpLine =~ /^LOCALCONF:\s*(.+?)$/)
> +        {
> +            push(@loLocalConf, $1);
> +        }
> +        elsif ($lpLine =~ /^bitbake/)
> +        {
> +            extract_repo(\%loBitbake, $lpLine);
> +        }
> +        elsif ($lpLine =~ /^[^,]+,[^,]+,[^,]+,[^,]+/)
> +        {
> +            my %loRepo;
> +            extract_repo(\%loRepo, $lpLine);
> +            push(@loRepos, \%loRepo);
> +        }
> +        else
> +        {
> +            print "convert_config() -   lpLine = $lpLine\n";
> +        }
> +    }
> +
> +
> +    my $loRelSrcDir = $loTargetDir;
> +    $loRelSrcDir =~ s/[^\/\.]/\.\./g;
> +    $loRelSrcDir =~ s/\.+/\.\./g;
> +
> +    open(XML, ">$loTargetFPFN");
> +    print XML "<?xml version='1.0'?>\n";
> +    print XML "<config>\n";
> +    print XML "    <description>${loDescription}</description>\n";
> +    print XML "\n";
> +    if ($#loMotd > -1)
> +    {
> +        print XML "    <xi:include href='${loRelSrcDir}/common/motd_cicd.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
> +    }
> +    if (-f "common/targets_${loTargets}.xml")
> +    {
> +        print XML "    <xi:include href='${loRelSrcDir}/common/targets_${loTargets}.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
> +    }
> +    print XML "    <xi:include href='${loRelSrcDir}/templates/${loLayerConfTemplate}' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
> +    print XML "    <xi:include href='${loRelSrcDir}/templates/${loLocalConfTemplate}' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
> +    print XML "\n";
> +    print XML "    <bitbake url='".$loBitbake{url}."' branch='".$loBitbake{branch}."' commit='".$loBitbake{commit}."'/>\n";
> +    print XML "\n";
> +    print XML "    <repos>\n";
> +
> +    foreach my $lpRepo (@loRepos)
> +    {
> +        print XML "        <repo name='$lpRepo->{name}' url='$lpRepo->{url}' branch='$lpRepo->{branch}' commit='$lpRepo->{commit}'";
> +        if (exists($lpRepo->{disabled}))
> +        {
> +            print XML " disabled='$lpRepo->{disabled}'";
> +        }
> +        print XML ">\n";
> +        if (exists($lpRepo->{layers}))
> +        {
> +            if ($#{$lpRepo->{layers}} == -1)
> +            {
> +                print XML "            <layers/>\n";
> +            }
> +            else
> +            {
> +                print XML "            <layers>\n";
> +                foreach my $lpLayer (@{$lpRepo->{layers}})
> +                {
> +                    print XML "                <layer>${lpLayer}</layer>\n";
> +                }
> +                print XML "            </layers>\n";
> +            }
> +        }
> +        print XML "        </repo>\n";
> +    }
> +
> +    print XML "    </repos>\n";
> +    print XML "\n";
> +    if ($#loLocalConf > -1)
> +    {
> +        print XML "    <local-conf>\n";
> +        foreach my $lpLocalConfLine (@loLocalConf)
> +        {
> +            print XML "        <line>${lpLocalConfLine}</line>\n";
> +        }
> +        print XML "    </local-conf>\n";
> +        print XML "\n";
> +    }
> +    print XML "    <tools>\n";
> +    print XML "        <tool type='oe-layersetup'>\n";
> +    print XML "            <var name='BITBAKE_INCLUSIVE_VARS' value='${loBitbakeInclusiveVars}'/>\n";
> +    print XML "        </tool>\n";
> +    print XML "    </tools>\n";
> +    print XML "</config>\n";
> +    close(XML);
> +}
> +
> +sub extract_repo
> +{
> +    my $rvRepoHash = shift;
> +    my $arLine = shift;
> +
> +    my ($loRepo, $loUrl, $loBranch, $loCommit, $loLayers) = split(",",$arLine);
> +
> +    if ($loRepo =~ /^#/)
> +    {
> +        $rvRepoHash->{disabled} = "true";
> +        $loRepo =~ s/^#//;
> +    }
> +
> +    $rvRepoHash->{name} = $loRepo;
> +    $rvRepoHash->{url} = $loUrl;
> +    $rvRepoHash->{branch} = $loBranch;
> +    $rvRepoHash->{commit} = $loCommit;
> +
> +    if ($loLayers)
> +    {
> +        $loLayers =~ s/layers=//;
> +        $rvRepoHash->{layers} = [ split(":",$loLayers) ];
> +    }
> +}
> +
> +sub convert_local_conf_template
> +{
> +    my $arFile = shift;
> +
> +    my $loTargetFPFN = $arFile;
> +    $loTargetFPFN =~ s/^\.\.\/sample-files/templates/;
> +    $loTargetFPFN =~ s/\.sample$/.xml/;
> +    my ($loTargetFN) = ($loTargetFPFN =~ /^templates\/(.+).xml$/);
> +
> +    print "convert: ${arFile} -> ${loTargetFPFN}\n";
> +
> +    my ($loTargetDir) = ($loTargetFPFN =~ /^(.+?)\/[^\/]+$/);
> +
> +    system("mkdir -p ${loTargetDir}");
> +
> +    open(CFG, $arFile);
> +    my @loLines = <CFG>;
> +    close(CFG);
> +
> +    open(XML, ">$loTargetFPFN");
> +    print XML "<local-conf-template name='${loTargetFN}'>\n";
> +
> +    foreach my $lpLine (@loLines)
> +    {
> +        chomp($lpLine);
> +
> +        $lpLine =~ s/OEBASE/TOPDIR/;
> +        $lpLine =~ s/^MACHINE/#MACHINE/;
> +
> +        $lpLine =~ s/&/&amp;/g;
> +        $lpLine =~ s/</&lt;/g;
> +        $lpLine =~ s/>/&gt;/g;
> +
> +        print XML "    <line>${lpLine}</line>\n";
> +    }
> +
> +    print XML "</local-conf-template>\n";
> +    close(XML);
> +}
> +
> +sub convert_bblayers_conf_template
> +{
> +    my $arFile = shift;
> +
> +    my $loTargetFPFN = $arFile;
> +    $loTargetFPFN =~ s/^\.\.\/sample-files/templates/;
> +    $loTargetFPFN =~ s/\.sample$/.xml/;
> +    my ($loTargetFN) = ($loTargetFPFN =~ /^templates\/(.+).xml$/);
> +
> +    print "convert: ${arFile} -> ${loTargetFPFN}\n";
> +
> +    my ($loTargetDir) = ($loTargetFPFN =~ /^(.+?)\/[^\/]+$/);
> +
> +    system("mkdir -p ${loTargetDir}");
> +
> +    open(CFG, $arFile);
> +    my @loLines = <CFG>;
> +    close(CFG);
> +
> +    open(XML, ">$loTargetFPFN");
> +    print XML "<bblayers-conf-template name='${loTargetFN}'>\n";
> +
> +    foreach my $lpLine (@loLines)
> +    {
> +        chomp($lpLine);
> +        print XML "    <line>${lpLine}</line>\n";
> +    }
> +
> +    print XML "</bblayers-conf-template>\n";
> +    close(XML);
> +}
> +
> diff --git a/src/common/motd_cicd.xml b/src/common/motd_cicd.xml
> new file mode 100644
> index 0000000..95a3ba9
> --- /dev/null
> +++ b/src/common/motd_cicd.xml
> @@ -0,0 +1,9 @@
> +<motd>
> +    <line>NOTE:</line>
> +    <line>NOTE: This config is reserved for CI/CD testing and requires manual intervention to build</line>
> +    <line>NOTE:</line>
> +    <line>NOTE: A few SRCREVs in the recipes might refer to commits on cicd/next branches for their</line>
> +    <line>NOTE: repos.  These recipes will not build correctly without also a change in your local.conf</line>
> +    <line>NOTE: to point the recipe to the appropriate cicd/next branch for that recipe.</line>
> +    <line>NOTE:</line>
> +</motd>
> diff --git a/src/common/targets_arago.xml b/src/common/targets_arago.xml
> new file mode 100644
> index 0000000..01d1b55
> --- /dev/null
> +++ b/src/common/targets_arago.xml
> @@ -0,0 +1,8 @@
> +<targets>
> +    <default>tisdk-default-image</default>
> +    <target>tisdk-base-image</target>
> +    <target>tisdk-bootstrap-base-image</target>
> +    <target>tisdk-bootstrap-image</target>
> +    <target>tisdk-thinlinux-image</target>
> +    <target>tisdk-tiny-image</target>
> +</targets>
> diff --git a/src/common/targets_poky.xml b/src/common/targets_poky.xml
> new file mode 100644
> index 0000000..74b89aa
> --- /dev/null
> +++ b/src/common/targets_poky.xml
> @@ -0,0 +1,3 @@
> +<targets>
> +    <default>core_image_minimal</default>
> +</targets>
> diff --git a/src/xslt/bitbake-setup-bblayers-conf.xslt b/src/xslt/bitbake-setup-bblayers-conf.xslt
> new file mode 100644
> index 0000000..5db3e0d
> --- /dev/null
> +++ b/src/xslt/bitbake-setup-bblayers-conf.xslt
> @@ -0,0 +1,45 @@
> +<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
> +<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
> +
> +<xsl:template match="/">
> +<xsl:apply-templates select='config/bblayers-conf-template'/>
> +<xsl:text>
> +BBLAYERS ?= " \
> +</xsl:text>
> +<xsl:apply-templates select='config/repos'/>
> +<xsl:text>"
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='bblayers-conf-template'>
> +<xsl:for-each select='line'>
> +<xsl:value-of select='text()'/>
> +<xsl:text>
> +</xsl:text>
> +</xsl:for-each>
> +</xsl:template>
> +
> +<xsl:template match='config/repos'>
> +<xsl:apply-templates select='repo[not(@disabled) or @disabled="no"]'/>
> +<xsl:text>    ##OEROOT##/../oe-layersetup
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='config/repos/repo'>
> +<xsl:variable name='loRepo' select='@name'/>
> +<xsl:choose>
> +<xsl:when test='layers/layer'>
> +<xsl:for-each select='layers/layer'>
> +<xsl:variable name='loLayer' select='text()'/>
> +<xsl:text>    ##OEROOT##/../</xsl:text><xsl:value-of select='$loRepo'/><xsl:text>/</xsl:text><xsl:value-of select='$loLayer'/><xsl:text>
> +</xsl:text>
> +</xsl:for-each>
> +</xsl:when>
> +<xsl:otherwise>
> +<xsl:text>    ##OEROOT##/../</xsl:text><xsl:value-of select='$loRepo'/><xsl:text>
> +</xsl:text>
> +</xsl:otherwise>
> +</xsl:choose>
> +</xsl:template>
> +
> +</xsl:stylesheet>
> diff --git a/src/xslt/bitbake-setup-conf-notes.xslt b/src/xslt/bitbake-setup-conf-notes.xslt
> new file mode 100644
> index 0000000..2dfba81
> --- /dev/null
> +++ b/src/xslt/bitbake-setup-conf-notes.xslt
> @@ -0,0 +1,32 @@
> +<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
> +<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
> +
> +<xsl:template match="/">
> +<xsl:text>
> +### Shell environment set up for builds. ###
> +
> +You can now run 'bitbake &lt;target&gt;'
> +
> +If you have not set MACHINE in your local.conf you can run
> +'MACHINE=xxxxx bitbake &lt;target&gt;'
> +
> +Common targets are:
> +    </xsl:text><xsl:value-of select='config/targets/default/text()'/><xsl:text>
> +</xsl:text>
> +<xsl:apply-templates select='config/targets/target'/>
> +<xsl:text>
> +You can also run generated qemu images with a command like 'runqemu qemux86-64'.
> +
> +Other commonly useful commands are:
> + - 'devtool' and 'recipetool' handle common recipe tasks
> + - 'bitbake-layers' handles common layer tasks
> + - 'oe-pkgdata-util' handles common target package tasks
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='config/targets/target'>
> +<xsl:text>    </xsl:text><xsl:value-of select='text()'/><xsl:text>
> +</xsl:text>
> +</xsl:template>
> +
> +</xsl:stylesheet>
> diff --git a/src/xslt/bitbake-setup-conf-summary.xslt b/src/xslt/bitbake-setup-conf-summary.xslt
> new file mode 100644
> index 0000000..88bbd7a
> --- /dev/null
> +++ b/src/xslt/bitbake-setup-conf-summary.xslt
> @@ -0,0 +1,9 @@
> +<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
> +<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
> +
> +<xsl:template match="/">
> +<xsl:value-of select='config/description/text()'/><xsl:text>
> +</xsl:text>
> +</xsl:template>
> +
> +</xsl:stylesheet>
> diff --git a/src/xslt/bitbake-setup-local-conf.xslt b/src/xslt/bitbake-setup-local-conf.xslt
> new file mode 100644
> index 0000000..c5c5e60
> --- /dev/null
> +++ b/src/xslt/bitbake-setup-local-conf.xslt
> @@ -0,0 +1,34 @@
> +<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
> +<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
> +
> +<xsl:template match="/">
> +<xsl:apply-templates select='config/local-conf-template'/>
> +<xsl:apply-templates select='config/local-conf'/>
> +</xsl:template>
> +
> +<xsl:template match='local-conf-template'>
> +<xsl:for-each select='line'>
> +<xsl:value-of select='text()'/>
> +<xsl:text>
> +</xsl:text>
> +</xsl:for-each>
> +</xsl:template>
> +
> +<xsl:template match='config/local-conf'>
> +<xsl:text>
> +
> +#====================================================================
> +# Settings from oe-layersetup config file: </xsl:text><xsl:value-of select='$arConfigName'/><xsl:text>
> +#
> +# Do not remove.
> +#--------------------------------------------------------------------
> +</xsl:text>
> +<xsl:for-each select='line'>
> +<xsl:value-of select='text()'/><xsl:text>
> +</xsl:text>
> +</xsl:for-each>
> +<xsl:text>#====================================================================
> +</xsl:text>
> +</xsl:template>
> +
> +</xsl:stylesheet>
> diff --git a/src/xslt/bitbake-setup.xslt b/src/xslt/bitbake-setup.xslt
> new file mode 100644
> index 0000000..5385c1f
> --- /dev/null
> +++ b/src/xslt/bitbake-setup.xslt
> @@ -0,0 +1,72 @@
> +<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
> +<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
> +<xsl:template match="/">
> +<xsl:text>{
> +  "version": "1.0",
> +</xsl:text>
> +<xsl:text>  "description": "</xsl:text><xsl:value-of select='config/description/text()'/><xsl:text>",
> +</xsl:text>
> +<xsl:apply-templates select='config/repos'/>
> +<xsl:text>  "configuration": {
> +    "bitbake-setup": {
> +      "default": {
> +        "description": "Default build configuration",
> +         "template": "oe-layersetup-</xsl:text><xsl:value-of select='$arConfigName'/><xsl:text>",
> +         "targets": [ "bitbake -k </xsl:text><xsl:value-of select='config/targets/default/text()'/><xsl:text>" ]
> +      }
> +    }
> +  }
> +}
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='config/repos'>
> +<xsl:text>  "sources": {
> +    "oe-layersetup": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
> +          }
> +        },
> +        "rev": "wip"
> +      },
> +      "path": "oe-layersetup"
> +    },
> +    "bitbake": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "</xsl:text><xsl:value-of select='/config/bitbake/@url'/><xsl:text>"
> +          }
> +        },
> +        "rev": "</xsl:text><xsl:value-of select='/config/bitbake/@branch'/><xsl:text>"
> +      },
> +      "path": "bitbake"
> +    },
> +</xsl:text>
> +<xsl:apply-templates select='repo[not(@disabled) or @disabled="no"]'/>
> +<xsl:text>  },
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='config/repos/repo'>
> +<xsl:text>    "</xsl:text><xsl:value-of select='@name'/><xsl:text>": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "</xsl:text><xsl:value-of select='@url'/><xsl:text>"
> +          }
> +        },
> +        "rev": "</xsl:text><xsl:value-of select='@branch'/><xsl:text>"
> +      },
> +      "path": "</xsl:text><xsl:value-of select='@name'/><xsl:text>"
> +    }</xsl:text>
> +<xsl:if test="position() != last()">
> +<xsl:text>,</xsl:text>
> +</xsl:if>
> +<xsl:text>
> +</xsl:text>
> +</xsl:template>
> +
> +</xsl:stylesheet>
> diff --git a/src/xslt/kas-templates.xslt b/src/xslt/kas-templates.xslt
> new file mode 100644
> index 0000000..57277f1
> --- /dev/null
> +++ b/src/xslt/kas-templates.xslt
> @@ -0,0 +1,38 @@
> +<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
> +<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
> +
> +<xsl:template match="/">header:
> +  version: 17
> +
> +<xsl:apply-templates select='bblayers-conf-template'/>
> +<xsl:apply-templates select='local-conf-template'/>
> +</xsl:template>
> +
> +<xsl:template match='bblayers-conf-template'>
> +<xsl:text>bblayers_conf_header:
> +</xsl:text>
> +<xsl:text>  oe-layersetup-bblayers-conf-template: |
> +</xsl:text>
> +<xsl:for-each select='line'>
> +<xsl:text>    </xsl:text><xsl:value-of select='text()'/><xsl:text>
> +</xsl:text>
> +</xsl:for-each>
> +<xsl:text>
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='local-conf-template'>
> +<xsl:text>local_conf_header:
> +</xsl:text>
> +<xsl:text>  oe-layersetup-local-conf-template: |
> +</xsl:text>
> +<xsl:for-each select='line'>
> +<xsl:text>    </xsl:text><xsl:value-of select='text()'/><xsl:text>
> +</xsl:text>
> +</xsl:for-each>
> +<xsl:apply-templates select='/config/local-conf'/>
> +<xsl:text>
> +</xsl:text>
> +</xsl:template>
> +
> +</xsl:stylesheet>
> diff --git a/src/xslt/kas.xslt b/src/xslt/kas.xslt
> new file mode 100644
> index 0000000..7e1dea4
> --- /dev/null
> +++ b/src/xslt/kas.xslt
> @@ -0,0 +1,70 @@
> +<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
> +<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
> +<xsl:template match="/">
> +<xsl:text>header:
> +  version: 17
> +  includes:
> +</xsl:text>
> +<xsl:apply-templates select='config/bblayers-conf-template'/>
> +<xsl:apply-templates select='config/local-conf-template'/>
> +<xsl:text>
> +</xsl:text>
> +<xsl:text>target: </xsl:text><xsl:value-of select='config/targets/default/text()'/><xsl:text>
> +</xsl:text>
> +<xsl:text>
> +</xsl:text>
> +<xsl:apply-templates select='config/repos'/>
> +<xsl:apply-templates select='config/local-conf'/>
> +</xsl:template>
> +
> +<xsl:template match='config/repos'>repos:
> +<xsl:apply-templates select='repo[not(@disabled) or @disabled="no"]'/>
> +</xsl:template>
> +
> +<xsl:template match='config/repos/repo'>
> +<xsl:text>  </xsl:text><xsl:value-of select='@name'/><xsl:text>:
> +</xsl:text>
> +<xsl:text>    url: "</xsl:text><xsl:value-of select='@url'/><xsl:text>"
> +</xsl:text>
> +<xsl:text>    branch: "</xsl:text><xsl:value-of select='@branch'/><xsl:text>"
> +</xsl:text>
> +<xsl:if test='@commit != "HEAD"'>
> +<xsl:text>    commit: "</xsl:text><xsl:value-of select='@commit'/><xsl:text>"
> +</xsl:text>
> +</xsl:if>
> +<xsl:apply-templates select='layers'/>
> +<xsl:text>
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='config/repos/repo/layers'>
> +<xsl:if test="*">
> +<xsl:text>    layers:
> +</xsl:text>
> +<xsl:for-each select='layer'>
> +<xsl:text>      </xsl:text><xsl:value-of select='text()'/>:
> +</xsl:for-each>
> +</xsl:if>
> +</xsl:template>
> +
> +<xsl:template match='config/bblayers-conf-template'>
> +<xsl:text>    - </xsl:text><xsl:value-of select='$arTemplatePrefix'/><xsl:text>/templates/</xsl:text><xsl:value-of select='@name'/><xsl:text>.yml
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='config/local-conf-template'>
> +<xsl:text>    - </xsl:text><xsl:value-of select='$arTemplatePrefix'/><xsl:text>/templates/</xsl:text><xsl:value-of select='@name'/><xsl:text>.yml
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='config/local-conf'>
> +<xsl:text>local_conf_header:
> +  oe-layersetup-local-conf-config-specific: |
> +</xsl:text>
> +<xsl:for-each select='line'>
> +<xsl:text>    </xsl:text><xsl:value-of select='text()'/><xsl:text>
> +</xsl:text>
> +</xsl:for-each>
> +</xsl:template>
> +
> +</xsl:stylesheet>
> diff --git a/src/xslt/oe-layersetup-templates.xslt b/src/xslt/oe-layersetup-templates.xslt
> new file mode 100644
> index 0000000..d1dcae5
> --- /dev/null
> +++ b/src/xslt/oe-layersetup-templates.xslt
> @@ -0,0 +1,25 @@
> +<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
> +<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
> +
> +<xsl:template match="/">
> +<xsl:apply-templates select='bblayers-conf-template'/>
> +<xsl:apply-templates select='local-conf-template'/>
> +</xsl:template>
> +
> +<xsl:template match='bblayers-conf-template'>
> +<xsl:for-each select='line'>
> +<xsl:value-of select='text()'/>
> +<xsl:text>
> +</xsl:text>
> +</xsl:for-each>
> +</xsl:template>
> +
> +<xsl:template match='local-conf-template'>
> +<xsl:for-each select='line'>
> +<xsl:value-of select='text()'/>
> +<xsl:text>
> +</xsl:text>
> +</xsl:for-each>
> +</xsl:template>
> +
> +</xsl:stylesheet>
> diff --git a/src/xslt/oe-layersetup.xslt b/src/xslt/oe-layersetup.xslt
> new file mode 100644
> index 0000000..1b51693
> --- /dev/null
> +++ b/src/xslt/oe-layersetup.xslt
> @@ -0,0 +1,75 @@
> +<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
> +<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
> +<xsl:template match="/"># This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +<xsl:apply-templates select='config/motd'/>
> +<xsl:apply-templates select='config/bitbake'/>
> +<xsl:apply-templates select='config/repos'/>
> +<xsl:apply-templates select='config/bblayers-conf-template'/>
> +<xsl:apply-templates select='config/local-conf-template'/>
> +<xsl:apply-templates select='config/tools/tool[@type="oe-layersetup"]'/>
> +<xsl:apply-templates select='config/local-conf'/>
> +</xsl:template>
> +
> +<xsl:template match='config/motd'>
> +<xsl:for-each select='line'>MOTD: <xsl:value-of select='text()'/><xsl:text>
> +</xsl:text>
> +</xsl:for-each>
> +<xsl:text>
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='config/bitbake'>
> +<xsl:text>bitbake,</xsl:text><xsl:value-of select='@url'/>,<xsl:value-of select='@branch'/>,<xsl:value-of select='@commit'/><xsl:text>
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='config/repos'>
> +<xsl:apply-templates select='repo'/>
> +<xsl:text>
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='config/repos/repo'>
> +<xsl:if test='@disabled="true"'>#</xsl:if>
> +<xsl:value-of select='@name'/>,<xsl:value-of select='@url'/>,<xsl:value-of select='@branch'/>,<xsl:value-of select='@commit'/>
> +<xsl:apply-templates select='layers'/>
> +<xsl:text>
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='config/repos/repo/layers'>,layers=<xsl:for-each select='layer'><xsl:value-of select='text()'/>
> +<xsl:if test="position() != last()">
> +<xsl:text>:</xsl:text>
> +</xsl:if>
> +</xsl:for-each>
> +</xsl:template>
> +
> +<xsl:template match='config/bblayers-conf-template'>
> +<xsl:text>OECORELAYERCONF=./sample-files/</xsl:text><xsl:value-of select='@name'/><xsl:text>.sample
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='config/local-conf-template'>
> +<xsl:text>OECORELOCALCONF=./sample-files/</xsl:text><xsl:value-of select='@name'/><xsl:text>.sample
> +</xsl:text>
> +</xsl:template>
> +
> +<xsl:template match='config/tools/tool'>
> +<xsl:for-each select='var'>
> +<xsl:value-of select='@name'/>=<xsl:value-of select='@value'/>
> +<xsl:text>
> +</xsl:text>
> +</xsl:for-each>
> +</xsl:template>
> +
> +<xsl:template match='config/local-conf'>
> +<xsl:for-each select='line'>
> +LOCALCONF:<xsl:value-of select='text()'/>
> +</xsl:for-each>
> +<xsl:text>
> +</xsl:text>
> +</xsl:template>
> +
> +</xsl:stylesheet>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

