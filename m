Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id 3F5B752C98
	for <meta-arago@arago-project.org>;
	Tue, 20 Apr 2021 04:04:17 +0000 (UTC)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
	[209.85.215.199]) by
	mx-outbound8-225.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 20 Apr 2021 04:04:41 +0000
Received: by mail-pg1-f199.google.com with SMTP id
	z19-20020a63e1130000b02901fcdcf0c5a3so7257232pgh.19
	for <meta-arago@arago-project.org>;
	Mon, 19 Apr 2021 21:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KtNf6KDdiiGcuAQo+2i/yWLVm4K08kuvoHF5VAHJQ8I=;
	b=npWv35xIb+51ZZT6tm2rZJQbeoSnWV4PZeKxD1uhz0kpqnfRrVm7EtLRQ+KabQWo7n
	AXDmLabDOl6veusraIjm86bI3RBwgddsLK+Pe4Fz9G5yoDh4bpiI0o2NPDdzvXHMXjn1
	h8vNPnTroJc5P7SK8u7yVzJ8zC31JTLCgt9yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KtNf6KDdiiGcuAQo+2i/yWLVm4K08kuvoHF5VAHJQ8I=;
	b=mB/NW74mWcC9Pt2WIeWG8jd9d5NEu8TrFswQRlQzpPnrwxpL4j4uayJStxct7V74Mu
	I+FcYpmkgpBpw2F+hS/GA/RwWhZDlG8bh9MkiX88lOxd9MDFN3Vha7A/OuOo8ugZOfhA
	UzX6Of++yJmdhzkc47pOvgz310PJ7HRrt7mDg1WO+I64lR1RCsraxfLLOb1+7APAugSg
	7Jq8ATo6ZctKTDo0WEPNAjK3PCdIZuGde8vWVjHV6b1226J2pMfey1DjJvFEQegpOdA2
	F2EB/VYTU6z232prXgydNB9AyhzFL2t9mG48TD0XnKhbxzSJOtNLjz6Ci3bPutC9jDwP
	Gwmg==
X-Gm-Message-State: AOAM533nKBvA3aerTHGzmIqruVcbcMNpUmlG3VN0ASznO452wG3gUORP
	Vse6sgusnUgLieGSvVCfxaE40mBTSrBhh9I05BNffkHvVxoAh0MLuo4sP/otzZ11KWSQl4JCrEd
	YibO/Ek4+iT/CAGvp5Jg6uNPrgLAZLM6TQczkufX/jYXEelYchVkQAWz5LsYy
X-Received: by 2002:a63:190b:: with SMTP id z11mr14633268pgl.314.1618891480587;
	Mon, 19 Apr 2021 21:04:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/yUxjaOstA8ORWXjU0Uznw9F0/fmahK3n3rjwVWWA+6gmkk/ihErLoNEjwyDgcEa6NFZKXA==
X-Received: by 2002:a63:190b:: with SMTP id z11mr14633258pgl.314.1618891480401;
	Mon, 19 Apr 2021 21:04:40 -0700 (PDT)
Received: from LAP000568.mistral.in ([2401:4900:3307:5453:4cbb:3396:1200:4622])
	by smtp.gmail.com with ESMTPSA id j7sm832201pjl.22.2021.04.19.21.04.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Apr 2021 21:04:40 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <x0257345@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 20 Apr 2021 09:34:32 +0530
Message-Id: <20210420040432.88976-1-x0257345@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1618891481-302273-19543-14981-1
X-BESS-VER: 2019.1_20210419.1831
X-BESS-Apparent-Source-IP: 209.85.215.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.231677 [from 
	cloudscan20-128.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-Mailman-Approved-At: Tue, 20 Apr 2021 13:17:49 +0000
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
X-List-Received-Date: Tue, 20 Apr 2021 04:04:17 -0000
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


