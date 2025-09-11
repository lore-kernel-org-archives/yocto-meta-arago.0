Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A343CAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 16:35:13 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.2131.1757608508519239539
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 09:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U8ruhi4K;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BGZ77v333912;
	Thu, 11 Sep 2025 11:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757608507;
	bh=mwob9oZbJdG452jTP+Dk3V9d8OvGW10l2NTPxaYPoqE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=U8ruhi4Kq2HOrS0BVYv76/0mAzBi58l2m7konEan3RxuEgeZRhVFnuKUAXEyFkinT
	 Wprh8ftwcCDv+jyE/u+qUgu/WjLHZ0cp8ZIgteA760YErENX4JgO6aMMWylpI1sMT/
	 g+D/83EPvgiPN7GMPGeRVS2u9xK5bn+lUwc5zRzA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BGZ7x01289111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 11:35:07 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 11:35:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 11:35:06 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BGZ6WC2120962;
	Thu, 11 Sep 2025 11:35:06 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uwkGI-0005KB-G0; Thu, 11 Sep 2025 11:35:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 2/5] src: Rework bitbake-setup support
Date: Thu, 11 Sep 2025 11:35:03 -0500
Message-ID: <20250911163506.20414-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250911163506.20414-1-reatmon@ti.com>
References: <20250911163506.20414-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Sep 2025 16:35:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16560

Recent changes to the upcoming bitbake-setup tool require a tweak to the
json files and layer files.  This commit updates the src files needed to
handle the change.

The big change since the last pass is that bitbake-setup no longer
requires a layer with templates for each config to list out the layers
and local.conf files.  The current json supports the layers and config
fragment files in the oe-layersetup layer for the local.conf settings.

- Add more detail to the distro xml files and rename them to reflect the
additional data in the file.
- Add the list of machines that meta-ti-bsp and meta-beagle support.
- Update the convert script to reflect the file name change above.
- Update the Makefile to stop generating the templates/ files.
- Remove the xslt for the templates/ files.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 src/Makefile                                  | 205 +++---------------
 src/bin/convert.pl                            |   8 +-
 src/common/distro_arago.xml                   |  14 ++
 src/common/distro_poky.xml                    |   9 +
 src/common/machines.xml                       |  39 ++++
 src/common/targets_arago.xml                  |   8 -
 src/common/targets_poky.xml                   |   3 -
 src/xslt/bitbake-setup-bblayers-conf.xslt     |  45 ----
 src/xslt/bitbake-setup-conf-notes.xslt        |  32 ---
 src/xslt/bitbake-setup-conf-summary.xslt      |   9 -
 src/xslt/bitbake-setup-config-localconf.xslt  |  20 ++
 src/xslt/bitbake-setup-local-conf.xslt        |  34 ---
 ...=> bitbake-setup-localconf-templates.xslt} |  11 +-
 src/xslt/bitbake-setup.xslt                   |  82 ++++++-
 src/xslt/kas.xslt                             |   4 +-
 15 files changed, 200 insertions(+), 323 deletions(-)
 create mode 100644 src/common/distro_arago.xml
 create mode 100644 src/common/distro_poky.xml
 create mode 100644 src/common/machines.xml
 delete mode 100644 src/common/targets_arago.xml
 delete mode 100644 src/common/targets_poky.xml
 delete mode 100644 src/xslt/bitbake-setup-bblayers-conf.xslt
 delete mode 100644 src/xslt/bitbake-setup-conf-notes.xslt
 delete mode 100644 src/xslt/bitbake-setup-conf-summary.xslt
 create mode 100644 src/xslt/bitbake-setup-config-localconf.xslt
 delete mode 100644 src/xslt/bitbake-setup-local-conf.xslt
 copy src/xslt/{oe-layersetup-templates.xslt => bitbake-setup-localconf-templates.xslt} (64%)

diff --git a/src/Makefile b/src/Makefile
index f71283a..27b83c4 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -10,29 +10,22 @@ TGT_KAS_TEMPLATES = $(patsubst templates/%,../kas/templates/%,$(patsubst %.xml,%
 
 TMP_BITBAKE_SETUP_FLATTENED_CONFIGS = $(subst /,_,$(patsubst configs/%,%,$(SRC_CONFIGS)))
 
-TGT_BITBAKE_SETUP_CONFIGS = $(patsubst %,../bitbake-setup/%,$(patsubst %.xml,%.json,$(TMP_BITBAKE_SETUP_FLATTENED_CONFIGS)))
-TGT_BITBAKE_SETUP_TEMPLATES_BBLAYERS_CONF = $(patsubst %,../conf/templates/%,$(patsubst %.xml,%/bblayers.conf.sample,$(TMP_BITBAKE_SETUP_FLATTENED_CONFIGS)))
-TGT_BITBAKE_SETUP_TEMPLATES_CONF_NOTES = $(patsubst %,../conf/templates/%,$(patsubst %.xml,%/conf-notes.txt,$(TMP_BITBAKE_SETUP_FLATTENED_CONFIGS)))
-TGT_BITBAKE_SETUP_TEMPLATES_CONF_SUMMARY = $(patsubst %,../conf/templates/%,$(patsubst %.xml,%/conf-summary.txt,$(TMP_BITBAKE_SETUP_FLATTENED_CONFIGS)))
-TGT_BITBAKE_SETUP_TEMPLATES_LOCAL_CONF = $(patsubst %,../conf/templates/%,$(patsubst %.xml,%/local.conf.sample,$(TMP_BITBAKE_SETUP_FLATTENED_CONFIGS)))
-TGT_BITBAKE_SETUP_TEMPLATES = $(TGT_BITBAKE_SETUP_TEMPLATES_BBLAYERS_CONF) \
-							  $(TGT_BITBAKE_SETUP_TEMPLATES_CONF_NOTES) \
-							  $(TGT_BITBAKE_SETUP_TEMPLATES_CONF_SUMMARY) \
-							  $(TGT_BITBAKE_SETUP_TEMPLATES_LOCAL_CONF)
-
+TGT_BITBAKE_SETUP_CONFIGS = $(patsubst %,../bitbake-setup/%,$(patsubst %.xml,%.json,$(patsubst configs/%,%,$(SRC_CONFIGS))))
+TGT_BITBAKE_SETUP_CONFIGS_LOCALCONF = $(patsubst %,../conf/fragments/localconf/configs/%,$(patsubst configs/%.xml,%.conf,$(SRC_CONFIGS)))
+TGT_BITBAKE_SETUP_LOCALCONF_TEMPLATES = $(patsubst %,../conf/fragments/localconf/%,$(patsubst templates/%.xml,%,$(filter-out templates/bblayers%,$(SRC_TEMPLATES))))
 TARGETS = $(TGT_OE_LAYERSETUP_CONFIGS) \
 		  $(TGT_OE_LAYERSETUP_TEMPLATES) \
 		  $(TGT_KAS_CONFIGS) \
 		  $(TGT_KAS_TEMPLATES) \
 		  $(TGT_BITBAKE_SETUP_CONFIGS) \
-		  $(TGT_BITBAKE_SETUP_TEMPLATES)
+		  $(TGT_BITBAKE_SETUP_LOCALCONF_TEMPLATES)
 
 all: $(TARGETS)
 
 clean:
 	@echo "  CLEAN ../kas"; rm -rf ../kas
 	@echo "  CLEAN ../bitbake-setup"; rm -rf ../bitbake-setup
-	@echo "  CLEAN ../conf/templates"; rm -rf ../conf/templates
+	@echo "  CLEAN ../conf/fragments"; rm -rf ../conf/fragments
 
 vars:
 	@echo "Source"
@@ -53,7 +46,8 @@ vars:
 	@echo "bitbake-setup"
 	@echo "-------------------------"
 	@echo "TGT_BITBAKE_SETUP_CONFIGS = $(TGT_BITBAKE_SETUP_CONFIGS)"
-	@echo "TGT_BITBAKE_SETUP_TEMPLATES = $(TGT_BITBAKE_SETUP_TEMPLATES)"
+	@echo "TGT_BITBAKE_SETUP_CONFIGS_LOCALCONF = $(TGT_BITBAKE_SETUP_CONFIGS_LOCALCONF)"
+	@echo "TGT_BITBAKE_SETUP_LOCALCONF_TEMPLATES = $(TGT_BITBAKE_SETUP_LOCALCONF_TEMPLATES)"
 	@echo ""
 	@echo "Targets"
 	@echo "-------------------------"
@@ -110,175 +104,48 @@ endef
 define xslt_bitbake_setup =
 	mkdir -p $(@D); \
 	echo "  XLST bitbake-setup $*"; \
-	xsltproc --stringparam arConfigName $$loConfigName --xinclude $^ > $@
+	xsltproc --stringparam arConfigName $$loConfigName --xinclude $^ > $@; \
+	loCheck=`grep local-conf configs/$*.xml`; \
+	if [ "$$loCheck" != "" ]; then \
+		loDir=`dirname ../conf/fragments/localconf/configs/$*.conf`; \
+		mkdir -p $$loDir; \
+		xsltproc --stringparam arConfigName $$loConfigName --xinclude xslt/bitbake-setup-config-localconf.xslt configs/$*.xml > ../conf/fragments/localconf/configs/$*.conf; \
+	fi
 endef
 
 ../bitbake-setup/%.json: xslt/bitbake-setup.xslt configs/%.xml
 	@loConfigName="$*"; \
 	$(xslt_bitbake_setup)
 
-../bitbake-setup/amsdk_%.json: xslt/bitbake-setup.xslt configs/amsdk/%.xml
-	@loConfigName="amsdk_$*"; \
-	$(xslt_bitbake_setup)
-
-../bitbake-setup/coresdk_%.json: xslt/bitbake-setup.xslt configs/coresdk/%.xml
-	@loConfigName="coresdk_$*"; \
-	$(xslt_bitbake_setup)
-
-../bitbake-setup/glsdk_%.json: xslt/bitbake-setup.xslt configs/glsdk/%.xml
-	@loConfigName="glsdk_$*"; \
-	$(xslt_bitbake_setup)
-
-../bitbake-setup/mcsdk_%.json: xslt/bitbake-setup.xslt configs/mcsdk/%.xml
-	@loConfigName="mcsdk_$*"; \
-	$(xslt_bitbake_setup)
-
-../bitbake-setup/processor-sdk_%.json: xslt/bitbake-setup.xslt configs/processor-sdk/%.xml
-	@loConfigName="processor-sdk_$*"; \
-	$(xslt_bitbake_setup)
-
-../bitbake-setup/processor-sdk-analytics_%.json: xslt/bitbake-setup.xslt configs/processor-sdk-analytics/%.xml
-	@loConfigName="processor-sdk-analytics_$*"; \
-	$(xslt_bitbake_setup)
-
-../bitbake-setup/processor-sdk-linux_%.json: xslt/bitbake-setup.xslt configs/processor-sdk-linux/%.xml
-	@loConfigName="processor-sdk-linux_$*"; \
-	$(xslt_bitbake_setup)
+../bitbake-setup/*.json: xslt/bitbake-setup-config-localconf.xslt
+../bitbake-setup/*/*.json: xslt/bitbake-setup-config-localconf.xslt
 
 #------------------------------------------------------------------------------
-# Bitbake-setup templates
+# Bitbake-setup config local-conf
 #------------------------------------------------------------------------------
-define xslt_bitbake_setup_templates =
+define xslt_bitbake_setup_config_localconf =
 	mkdir -p $(@D); \
-	echo "  XLST bitbake-setup-templates $*"; \
-	xsltproc --stringparam arConfigName $$loConfigName --xinclude $^ > $@
+	echo "  XLST bitbake-setup-config-localconf $*"; \
+	xsltproc --stringparam arConfigName $$loConfigName --xinclude $^ > $@; \
+	if [ -s $@ ]; then \
+		echo "remove empty file: $@"; \
+		rm -rf $@; \
+	fi
 endef
 
-../conf/templates/%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/%.xml
+../conf/fragments/localconf/configs/%.conf: xslt/bitbake-setup-config-localconf.xslt configs/%.xml
 	@loConfigName="$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/amsdk_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/amsdk/%.xml
-	@loConfigName="amsdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/coresdk_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/coresdk/%.xml
-	@loConfigName="coresdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/glsdk_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/glsdk/%.xml
-	@loConfigName="glsdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/mcsdk_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/mcsdk/%.xml
-	@loConfigName="mcsdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/processor-sdk_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/processor-sdk/%.xml
-	@loConfigName="processor-sdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/processor-sdk-analytics_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/processor-sdk-analytics/%.xml
-	@loConfigName="processor-sdk-analytics_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/processor-sdk-linux_%/bblayers.conf.sample: xslt/bitbake-setup-bblayers-conf.xslt configs/processor-sdk-linux/%.xml
-	@loConfigName="processor-sdk-linux_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/%.xml
-	@loConfigName="$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/amsdk_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/amsdk/%.xml
-	@loConfigName="amsdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/coresdk_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/coresdk/%.xml
-	@loConfigName="coresdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/glsdk_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/glsdk/%.xml
-	@loConfigName="glsdk_$*"; \
-	$(xslt_bitbake_setup_templates)
+	$(xslt_bitbake_setup_config_localconf)
 
-../conf/templates/mcsdk_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/mcsdk/%.xml
-	@loConfigName="mcsdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/processor-sdk_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/processor-sdk/%.xml
-	@loConfigName="processor-sdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/processor-sdk-analytics_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/processor-sdk-analytics/%.xml
-	@loConfigName="processor-sdk-analytics_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/processor-sdk-linux_%/conf-notes.txt: xslt/bitbake-setup-conf-notes.xslt configs/processor-sdk-linux/%.xml
-	@loConfigName="processor-sdk-linux_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/%.xml
-	@loConfigName="$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/amsdk_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/amsdk/%.xml
-	@loConfigName="amsdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/coresdk_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/coresdk/%.xml
-	@loConfigName="coresdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/glsdk_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/glsdk/%.xml
-	@loConfigName="glsdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/mcsdk_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/mcsdk/%.xml
-	@loConfigName="mcsdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/processor-sdk_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/processor-sdk/%.xml
-	@loConfigName="processor-sdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/processor-sdk-analytics_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/processor-sdk-analytics/%.xml
-	@loConfigName="processor-sdk-analytics_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/processor-sdk-linux_%/conf-summary.txt: xslt/bitbake-setup-conf-summary.xslt configs/processor-sdk-linux/%.xml
-	@loConfigName="processor-sdk-linux_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/%.xml
-	@loConfigName="$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/amsdk_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/amsdk/%.xml
-	@loConfigName="amsdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/coresdk_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/coresdk/%.xml
-	@loConfigName="coresdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/glsdk_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/glsdk/%.xml
-	@loConfigName="glsdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/mcsdk_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/mcsdk/%.xml
-	@loConfigName="mcsdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/processor-sdk_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/processor-sdk/%.xml
-	@loConfigName="processor-sdk_$*"; \
-	$(xslt_bitbake_setup_templates)
-
-../conf/templates/processor-sdk-analytics_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/processor-sdk-analytics/%.xml
-	@loConfigName="processor-sdk-analytics_$*"; \
-	$(xslt_bitbake_setup_templates)
+#------------------------------------------------------------------------------
+# Bitbake localconf templates
+#------------------------------------------------------------------------------
+define bitbake_setup_localconf_templates =
+	mkdir -p $(@D); \
+	echo "  XLST bitbake-setup-localconf-templates $*"; \
+	xsltproc --xinclude $^ > $@
+endef
 
-../conf/templates/processor-sdk-linux_%/local.conf.sample: xslt/bitbake-setup-local-conf.xslt configs/processor-sdk-linux/%.xml
-	@loConfigName="processor-sdk-linux_$*"; \
-	$(xslt_bitbake_setup_templates)
+../conf/fragments/localconf/%: xslt/bitbake-setup-localconf-templates.xslt templates/%.xml
+	@$(bitbake_setup_localconf_templates)
 
diff --git a/src/bin/convert.pl b/src/bin/convert.pl
index 42b9c2c..f8928d0 100755
--- a/src/bin/convert.pl
+++ b/src/bin/convert.pl
@@ -360,9 +360,13 @@ sub convert_config
     {
         print XML "    <xi:include href='${loRelSrcDir}/common/motd_cicd.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
     }
-    if (-f "${glSrcDir}/common/targets_${loDistro}.xml")
+    if (-f "${glSrcDir}/common/distro_${loDistro}.xml")
     {
-        print XML "    <xi:include href='${loRelSrcDir}/common/targets_${loDistro}.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
+        print XML "    <xi:include href='${loRelSrcDir}/common/distro_${loDistro}.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
+    }
+    if (-f "${glSrcDir}/common/machines.xml")
+    {
+        print XML "    <xi:include href='${loRelSrcDir}/common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
     }
     print XML "    <xi:include href='${loRelSrcDir}/templates/${loLayerConfTemplate}' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
     print XML "    <xi:include href='${loRelSrcDir}/templates/${loLocalConfTemplate}' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
diff --git a/src/common/distro_arago.xml b/src/common/distro_arago.xml
new file mode 100644
index 0000000..541332c
--- /dev/null
+++ b/src/common/distro_arago.xml
@@ -0,0 +1,14 @@
+<distro name='arago'>
+    <description>TI Arago distro build</description>
+    <configs>
+        <config>arago</config>
+    </configs>
+    <targets>
+        <default>tisdk-default-image</default>
+        <target>tisdk-base-image</target>
+        <target>tisdk-bootstrap-base-image</target>
+        <target>tisdk-bootstrap-image</target>
+        <target>tisdk-thinlinux-image</target>
+        <target>tisdk-tiny-image</target>
+    </targets>
+</distro>
diff --git a/src/common/distro_poky.xml b/src/common/distro_poky.xml
new file mode 100644
index 0000000..864f27e
--- /dev/null
+++ b/src/common/distro_poky.xml
@@ -0,0 +1,9 @@
+<distro name='poky'>
+    <description>Yocto Project Poky reference distro build</description>
+    <configs>
+        <config>poky</config>
+    </configs>
+    <targets>
+        <default>core_image_minimal</default>
+    </targets>
+</distro>
diff --git a/src/common/machines.xml b/src/common/machines.xml
new file mode 100644
index 0000000..7319bc5
--- /dev/null
+++ b/src/common/machines.xml
@@ -0,0 +1,39 @@
+<machines>
+    <machine>am335x-evm</machine>
+    <machine>am335x-hs-evm</machine>
+    <machine>am437x-evm</machine>
+    <machine>am437x-hs-evm</machine>
+    <machine>am57xx-evm</machine>
+    <machine>am57xx-hs-evm</machine>
+    <machine>am62xx-evm</machine>
+    <machine>am62xx-lp-evm</machine>
+    <machine>am62xxsip-evm</machine>
+    <machine>am62axx-evm</machine>
+    <machine>am62dxx-evm</machine>
+    <machine>am62lxx-evm</machine>
+    <machine>am62pxx-evm</machine>
+    <machine>am64xx-evm</machine>
+    <machine>am65xx-evm</machine>
+    <machine>am65xx-hs-evm</machine>
+    <machine>am68-sk</machine>
+    <machine>am69-sk</machine>
+    <machine>beagle-x15</machine>
+    <machine>beaglebone</machine>
+    <machine>beaglebone-ai64</machine>
+    <machine>beagleplay</machine>
+    <machine>beagleplay-ti</machine>
+    <machine>beagley-ai</machine>
+    <machine>j7-evm</machine>
+    <machine>j7-hs-evm</machine>
+    <machine>j721e-evm</machine>
+    <machine>j721e-sk</machine>
+    <machine>j7200-evm</machine>
+    <machine>j7200-hs-evm</machine>
+    <machine>j721s2-evm</machine>
+    <machine>j721s2-hs-evm</machine>
+    <machine>j742s2-evm</machine>
+    <machine>j784s4-evm</machine>
+    <machine>j784s4-hs-evm</machine>
+    <machine>j722s-evm</machine>
+    <machine>pocketbeagle2</machine>
+</machines>
diff --git a/src/common/targets_arago.xml b/src/common/targets_arago.xml
deleted file mode 100644
index 01d1b55..0000000
--- a/src/common/targets_arago.xml
+++ /dev/null
@@ -1,8 +0,0 @@
-<targets>
-    <default>tisdk-default-image</default>
-    <target>tisdk-base-image</target>
-    <target>tisdk-bootstrap-base-image</target>
-    <target>tisdk-bootstrap-image</target>
-    <target>tisdk-thinlinux-image</target>
-    <target>tisdk-tiny-image</target>
-</targets>
diff --git a/src/common/targets_poky.xml b/src/common/targets_poky.xml
deleted file mode 100644
index 74b89aa..0000000
--- a/src/common/targets_poky.xml
+++ /dev/null
@@ -1,3 +0,0 @@
-<targets>
-    <default>core_image_minimal</default>
-</targets>
diff --git a/src/xslt/bitbake-setup-bblayers-conf.xslt b/src/xslt/bitbake-setup-bblayers-conf.xslt
deleted file mode 100644
index 5db3e0d..0000000
--- a/src/xslt/bitbake-setup-bblayers-conf.xslt
+++ /dev/null
@@ -1,45 +0,0 @@
-<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
-<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
-
-<xsl:template match="/">
-<xsl:apply-templates select='config/bblayers-conf-template'/>
-<xsl:text>
-BBLAYERS ?= " \
-</xsl:text>
-<xsl:apply-templates select='config/repos'/>
-<xsl:text>"
-</xsl:text>
-</xsl:template>
-
-<xsl:template match='bblayers-conf-template'>
-<xsl:for-each select='line'>
-<xsl:value-of select='text()'/>
-<xsl:text>
-</xsl:text>
-</xsl:for-each>
-</xsl:template>
-
-<xsl:template match='config/repos'>
-<xsl:apply-templates select='repo[not(@disabled) or @disabled="no"]'/>
-<xsl:text>    ##OEROOT##/../oe-layersetup
-</xsl:text>
-</xsl:template>
-
-<xsl:template match='config/repos/repo'>
-<xsl:variable name='loRepo' select='@name'/>
-<xsl:choose>
-<xsl:when test='layers/layer'>
-<xsl:for-each select='layers/layer'>
-<xsl:variable name='loLayer' select='text()'/>
-<xsl:text>    ##OEROOT##/../</xsl:text><xsl:value-of select='$loRepo'/><xsl:text>/</xsl:text><xsl:value-of select='$loLayer'/><xsl:text>
-</xsl:text>
-</xsl:for-each>
-</xsl:when>
-<xsl:otherwise>
-<xsl:text>    ##OEROOT##/../</xsl:text><xsl:value-of select='$loRepo'/><xsl:text>
-</xsl:text>
-</xsl:otherwise>
-</xsl:choose>
-</xsl:template>
-
-</xsl:stylesheet>
diff --git a/src/xslt/bitbake-setup-conf-notes.xslt b/src/xslt/bitbake-setup-conf-notes.xslt
deleted file mode 100644
index 2dfba81..0000000
--- a/src/xslt/bitbake-setup-conf-notes.xslt
+++ /dev/null
@@ -1,32 +0,0 @@
-<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
-<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
-
-<xsl:template match="/">
-<xsl:text>
-### Shell environment set up for builds. ###
-
-You can now run 'bitbake &lt;target&gt;'
-
-If you have not set MACHINE in your local.conf you can run
-'MACHINE=xxxxx bitbake &lt;target&gt;'
-
-Common targets are:
-    </xsl:text><xsl:value-of select='config/targets/default/text()'/><xsl:text>
-</xsl:text>
-<xsl:apply-templates select='config/targets/target'/>
-<xsl:text>
-You can also run generated qemu images with a command like 'runqemu qemux86-64'.
-
-Other commonly useful commands are:
- - 'devtool' and 'recipetool' handle common recipe tasks
- - 'bitbake-layers' handles common layer tasks
- - 'oe-pkgdata-util' handles common target package tasks
-</xsl:text>
-</xsl:template>
-
-<xsl:template match='config/targets/target'>
-<xsl:text>    </xsl:text><xsl:value-of select='text()'/><xsl:text>
-</xsl:text>
-</xsl:template>
-
-</xsl:stylesheet>
diff --git a/src/xslt/bitbake-setup-conf-summary.xslt b/src/xslt/bitbake-setup-conf-summary.xslt
deleted file mode 100644
index 88bbd7a..0000000
--- a/src/xslt/bitbake-setup-conf-summary.xslt
+++ /dev/null
@@ -1,9 +0,0 @@
-<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
-<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
-
-<xsl:template match="/">
-<xsl:value-of select='config/description/text()'/><xsl:text>
-</xsl:text>
-</xsl:template>
-
-</xsl:stylesheet>
diff --git a/src/xslt/bitbake-setup-config-localconf.xslt b/src/xslt/bitbake-setup-config-localconf.xslt
new file mode 100644
index 0000000..88e29bc
--- /dev/null
+++ b/src/xslt/bitbake-setup-config-localconf.xslt
@@ -0,0 +1,20 @@
+<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
+<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
+
+<xsl:template match="/">
+<xsl:apply-templates select='config/local-conf'/>
+</xsl:template>
+
+<xsl:template match='config/local-conf'>
+<xsl:text>BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for </xsl:text><xsl:value-of select='$arConfigName'/><xsl:text>"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for </xsl:text><xsl:value-of select='$arConfigName'/><xsl:text>"
+
+</xsl:text>
+<xsl:for-each select='line'>
+<xsl:value-of select='text()'/>
+<xsl:text>
+</xsl:text>
+</xsl:for-each>
+</xsl:template>
+
+</xsl:stylesheet>
diff --git a/src/xslt/bitbake-setup-local-conf.xslt b/src/xslt/bitbake-setup-local-conf.xslt
deleted file mode 100644
index c5c5e60..0000000
--- a/src/xslt/bitbake-setup-local-conf.xslt
+++ /dev/null
@@ -1,34 +0,0 @@
-<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
-<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
-
-<xsl:template match="/">
-<xsl:apply-templates select='config/local-conf-template'/>
-<xsl:apply-templates select='config/local-conf'/>
-</xsl:template>
-
-<xsl:template match='local-conf-template'>
-<xsl:for-each select='line'>
-<xsl:value-of select='text()'/>
-<xsl:text>
-</xsl:text>
-</xsl:for-each>
-</xsl:template>
-
-<xsl:template match='config/local-conf'>
-<xsl:text>
-
-#====================================================================
-# Settings from oe-layersetup config file: </xsl:text><xsl:value-of select='$arConfigName'/><xsl:text>
-#
-# Do not remove.
-#--------------------------------------------------------------------
-</xsl:text>
-<xsl:for-each select='line'>
-<xsl:value-of select='text()'/><xsl:text>
-</xsl:text>
-</xsl:for-each>
-<xsl:text>#====================================================================
-</xsl:text>
-</xsl:template>
-
-</xsl:stylesheet>
diff --git a/src/xslt/oe-layersetup-templates.xslt b/src/xslt/bitbake-setup-localconf-templates.xslt
similarity index 64%
copy from src/xslt/oe-layersetup-templates.xslt
copy to src/xslt/bitbake-setup-localconf-templates.xslt
index d1dcae5..d6d576a 100644
--- a/src/xslt/oe-layersetup-templates.xslt
+++ b/src/xslt/bitbake-setup-localconf-templates.xslt
@@ -2,16 +2,11 @@
 <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
 
 <xsl:template match="/">
-<xsl:apply-templates select='bblayers-conf-template'/>
-<xsl:apply-templates select='local-conf-template'/>
-</xsl:template>
+    <xsl:text>BB_CONF_FRAGMENT_SUMMARY = "</xsl:text><xsl:value-of select='local-conf-template/summary/text()'/><xsl:text>"
+BB_CONF_FRAGMENT_DESCRIPTION = "</xsl:text><xsl:value-of select='local-conf-template/description/text()'/><xsl:text>"
 
-<xsl:template match='bblayers-conf-template'>
-<xsl:for-each select='line'>
-<xsl:value-of select='text()'/>
-<xsl:text>
 </xsl:text>
-</xsl:for-each>
+<xsl:apply-templates select='local-conf-template'/>
 </xsl:template>
 
 <xsl:template match='local-conf-template'>
diff --git a/src/xslt/bitbake-setup.xslt b/src/xslt/bitbake-setup.xslt
index 5f25a04..18e0d0e 100644
--- a/src/xslt/bitbake-setup.xslt
+++ b/src/xslt/bitbake-setup.xslt
@@ -6,21 +6,34 @@
 </xsl:text>
 <xsl:text>  "description": "</xsl:text><xsl:value-of select='config/description/text()'/><xsl:text>",
 </xsl:text>
-<xsl:apply-templates select='config/repos'/>
-<xsl:text>  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-</xsl:text><xsl:value-of select='$arConfigName'/><xsl:text>",
-         "targets": [ "bitbake -k </xsl:text><xsl:value-of select='config/targets/default/text()'/><xsl:text>" ]
+<xsl:apply-templates select='config/repos' mode='repo-list'/>
+<xsl:variable name='loFragmentFilename' select="config/local-conf-template/@name"/>
+<xsl:variable name='loFragmentName' select="substring-before($loFragmentFilename,'.conf')"/>
+<xsl:text>  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "</xsl:text><xsl:value-of select='config/distro/@name'/><xsl:text>",
+        "description": "</xsl:text><xsl:value-of select='config/distro/description/text()'/><xsl:text>",
+        "bb-layers": [ </xsl:text><xsl:apply-templates select='config/repos' mode='layer-list'/><xsl:text> ],
+        "oe-fragments": [ "oe-layersetup/localconf/</xsl:text><xsl:value-of select='$loFragmentName'/><xsl:text>"</xsl:text><xsl:apply-templates select='config/local-conf'/><xsl:text> ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ </xsl:text><xsl:apply-templates select='config/machines'/><xsl:text> ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ </xsl:text><xsl:apply-templates select='config/distro/configs'/><xsl:text> ]
+          }
+        }
       }
-    }
+    ]
   }
 }
 </xsl:text>
 </xsl:template>
 
-<xsl:template match='config/repos'>
+<xsl:template match='config/repos' mode='repo-list'>
 <xsl:text>  "sources": {
     "oe-layersetup": {
       "git-remote": {
@@ -45,12 +58,12 @@
       "path": "bitbake"
     },
 </xsl:text>
-<xsl:apply-templates select='repo[not(@disabled) or @disabled="no"]'/>
+<xsl:apply-templates select='repo[not(@disabled) or @disabled="no"]' mode='repo-list'/>
 <xsl:text>  },
 </xsl:text>
 </xsl:template>
 
-<xsl:template match='config/repos/repo'>
+<xsl:template match='config/repos/repo' mode='repo-list'>
 <xsl:text>    "</xsl:text><xsl:value-of select='@name'/><xsl:text>": {
       "git-remote": {
         "remotes": {
@@ -69,4 +82,51 @@
 </xsl:text>
 </xsl:template>
 
+<xsl:template match='config/repos' mode='layer-list'>
+<xsl:for-each select='repo[not(@disabled) or @disabled="no"]'>
+<xsl:apply-templates select='.' mode='layer-list'/>
+<xsl:text>,</xsl:text>
+</xsl:for-each>
+<xsl:text>"oe-layersetup"</xsl:text>
+</xsl:template>
+
+<xsl:template match='config/repos/repo' mode='layer-list'>
+<xsl:variable name='loRepo' select='@name'/>
+<xsl:choose>
+<xsl:when test='layers/layer'>
+<xsl:for-each select='layers/layer'>
+<xsl:variable name='loLayer' select='text()'/>
+<xsl:text>"</xsl:text><xsl:value-of select='$loRepo'/><xsl:text>/</xsl:text><xsl:value-of select='$loLayer'/><xsl:text>"</xsl:text><xsl:if test="position() != last()">
+<xsl:text>,</xsl:text>
+</xsl:if>
+</xsl:for-each>
+</xsl:when>
+<xsl:otherwise>
+<xsl:text>"</xsl:text><xsl:value-of select='$loRepo'/><xsl:text>"</xsl:text>
+</xsl:otherwise>
+</xsl:choose>
+</xsl:template>
+
+<xsl:template match='config/distro/configs'>
+<xsl:for-each select='config'>
+<xsl:variable name='loConfig' select='text()'/>
+<xsl:text>"distro/</xsl:text><xsl:value-of select='$loConfig'/><xsl:text>"</xsl:text><xsl:if test="position() != last()">
+<xsl:text>,</xsl:text>
+</xsl:if>
+</xsl:for-each>
+</xsl:template>
+
+<xsl:template match='config/machines'>
+<xsl:for-each select='machine'>
+<xsl:variable name='loMachine' select='text()'/>
+<xsl:text>"machine/</xsl:text><xsl:value-of select='$loMachine'/><xsl:text>"</xsl:text><xsl:if test="position() != last()">
+<xsl:text>,</xsl:text>
+</xsl:if>
+</xsl:for-each>
+</xsl:template>
+
+<xsl:template match='config/local-conf'>
+    <xsl:text>, "oe-layersetup/localconf/configs/</xsl:text><xsl:value-of select='$arConfigName'/><xsl:text>.conf"</xsl:text>
+</xsl:template>
+
 </xsl:stylesheet>
diff --git a/src/xslt/kas.xslt b/src/xslt/kas.xslt
index 4a9fe62..b78b788 100644
--- a/src/xslt/kas.xslt
+++ b/src/xslt/kas.xslt
@@ -8,7 +8,7 @@ header:
 </xsl:text>
 <xsl:apply-templates select='config/bblayers-conf-template'/>
 <xsl:apply-templates select='config/local-conf-template'/>
-<xsl:apply-templates select='config/targets/default'/>
+<xsl:apply-templates select='config/distro/targets/default'/>
 <xsl:if test='config/bitbake|config/repos'>
 <xsl:text>
 </xsl:text>
@@ -17,7 +17,7 @@ header:
 <xsl:apply-templates select='config/local-conf'/>
 </xsl:template>
 
-<xsl:template match='config/targets/default'>
+<xsl:template match='config/distro/targets/default'>
 <xsl:text>
 target: </xsl:text><xsl:value-of select='text()'/><xsl:text>
 </xsl:text>
-- 
2.17.1


