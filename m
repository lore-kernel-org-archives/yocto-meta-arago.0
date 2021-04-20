Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from egress-ip4b.ess.de.barracuda.com
	(egress-ip4b.ess.de.barracuda.com [18.185.115.208])
	by arago-project.org (Postfix) with ESMTPS id 77C3052CB3
	for <meta-arago@arago-project.org>;
	Tue, 20 Apr 2021 17:41:38 +0000 (UTC)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
	[209.85.210.200]) by
	mx-outbound18-250.eu-central-1b.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 20 Apr 2021 17:42:03 +0000
Received: by mail-pf1-f200.google.com with SMTP id
	i188-20020a62c1c50000b0290261337d9ebfso3087366pfg.12
	for <meta-arago@arago-project.org>;
	Tue, 20 Apr 2021 10:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KtNf6KDdiiGcuAQo+2i/yWLVm4K08kuvoHF5VAHJQ8I=;
	b=QqSoVmZG3y2UgClZDANYRbbbVkCA6WsjXS5FSjF4ObEINbWQojhqKEkVwPN0jFTeG4
	nwZ3uSy2tyTAxZs8sKM7x2C6kMc2TorUZV/+WG13i5JafLsh0DF3nQVdFIM3qjbPBXQN
	FIud4J2Ws+PKC/t+I/o3gxGdIeHgu++gfAa4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KtNf6KDdiiGcuAQo+2i/yWLVm4K08kuvoHF5VAHJQ8I=;
	b=gPbEDlZteSGZHRZu5T5O9CKWfEgfB23f2Y5Nzi+kL9eL9OPD18EDsTrOlc92yNfPFA
	DB3hLMzx7lgLV/8XM8IEGoD605Dq45XdBOlCXezYCrTWgYiuxC06x1AU0M3j++m1GWLy
	5f+wLDk+n5Pm7soW2tTVfDt0divnwPuhJOINsU7Ud4Ms+ztXawuu2vb7FfZBnh5wB6sk
	VcDULMHTTSeoKeEoRikYYtiyVIT7r7bvU1bQ95M9N2O+7ExlN8MCas8iCwQrh3cZUUxi
	Hmlnc3hovqAxj9eRleuLxgz1YGpRiGre8BIM/8enlMsKMrjg6Bk41+UzXlX1mhmhBWuc
	+JwA==
X-Gm-Message-State: AOAM533vtNqfDpQUMHMiT8deckk9TtI0hwPSpEuv0FYVuYZaBRJPaKI/
	F6QrH+tKKdpeG0qD+S0jH+BscsxaSScqzuqqViP2Ne6xeavoIbjjIbII95fglsjo34lNn+JQYJy
	X0mvloMPd+NbetSz8Xzp0XjvN7c08i7Aa1q6axYRtaxNNji4R+Amh+6XOlEvJ
X-Received: by 2002:a17:903:248e:b029:ec:b399:7d75 with SMTP id
	p14-20020a170903248eb02900ecb3997d75mr6415612plw.35.1618940521910;
	Tue, 20 Apr 2021 10:42:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3Gi1Uijsu/IRVkc4Go/s4yyyeFJR31kC4pxNXVV0OxV5KX//Do9GK9pjw9hu8SZxE5qNfzQ==
X-Received: by 2002:a17:903:248e:b029:ec:b399:7d75 with SMTP id
	p14-20020a170903248eb02900ecb3997d75mr6415595plw.35.1618940521712;
	Tue, 20 Apr 2021 10:42:01 -0700 (PDT)
Received: from LAP000568.mistral.in ([49.207.198.212])
	by smtp.gmail.com with ESMTPSA id
	lx15sm2898898pjb.56.2021.04.20.10.42.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Apr 2021 10:42:01 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <x0257345@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 20 Apr 2021 23:11:55 +0530
Message-Id: <20210420174155.50628-1-x0257345@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1618940522-304858-26674-1741-1
X-BESS-VER: 2019.1_20210420.1639
X-BESS-Apparent-Source-IP: 209.85.210.200
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.231689 [from 
	cloudscan19-219.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Subject: [dunfell/master PATCH 1/1] AM64x Unification Add recipes to generate WIC file
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
X-List-Received-Date: Tue, 20 Apr 2021 17:41:39 -0000
Content-Transfer-Encoding: 8bit

  Add two recipies to generate two WIC files for AM64x EVM and SK.
  Each recipe has its own path to the deployed boot images and
  corresponding WIC file name.
---
 .../images/tisdk-base-image-evm.bb            | 19 +++++++++++++++++
 .../images/tisdk-base-image-sk.bb             | 21 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-base-image-evm.bb
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-base-image-sk.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image-evm.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image-evm.bb
new file mode 100644
index 00000000..14813bad
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image-evm.bb
@@ -0,0 +1,19 @@
+# Arago TI SDK base image with test tools
+# Suitable for initramfs
+
+require recipes-core/images/arago-image.inc
+
+IMAGE_FSTYPES += "cpio.xz"
+IMAGE_FSTYPES_append_dra7xx = " ubifs ubi"
+
+IMAGE_INSTALL += "\
+    packagegroup-arago-base \
+    packagegroup-arago-console \
+    packagegroup-arago-base-tisdk \
+    ${VIRTUAL-RUNTIME_initramfs} \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', 'ti-test', '', d)} \
+    "
+
+export IMAGE_BASENAME = "tisdk-base-image-evm"
+export IMAGE_LINK_NAME = "tisdk-base-image-am64xx-evm"
+export DEPLOY_DIR_IMAGE="/mnt/4TB-VD1/ti_devm_sdk/devm_linux/am64x_sk/yocto_local_am64x_sk/oe-layersetup/build/arago-tmp-external-arm-glibc/deploy/images/am64xx-evm/evm"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image-sk.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image-sk.bb
new file mode 100644
index 00000000..571e8395
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image-sk.bb
@@ -0,0 +1,21 @@
+# Arago TI SDK base image with test tools
+# Suitable for initramfs
+
+require  recipes-core/images/arago-image.inc
+
+IMAGE_FSTYPES += "cpio.xz"
+IMAGE_FSTYPES_append_dra7xx = " ubifs ubi"
+
+IMAGE_INSTALL += "\
+    packagegroup-arago-base \
+    packagegroup-arago-console \
+    packagegroup-arago-base-tisdk \
+    ${VIRTUAL-RUNTIME_initramfs} \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', 'ti-test', '', d)} \
+    "
+
+export IMAGE_BASENAME = "tisdk-base-image-sk"
+
+export IMAGE_BASENAME = "tisdk-base-image-sk"
+export IMAGE_LINK_NAME = "tisdk-base-image-am64xx-sk"
+export DEPLOY_DIR_IMAGE="/mnt/4TB-VD1/ti_devm_sdk/devm_linux/am64x_sk/yocto_local_am64x_sk/oe-layersetup/build/arago-tmp-external-arm-glibc/deploy/images/am64xx-evm/sk"
-- 
2.17.0


