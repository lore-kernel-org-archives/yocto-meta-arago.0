Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id 4CC0752AB6
	for <meta-arago@arago-project.org>;
	Mon, 19 Apr 2021 11:47:40 +0000 (UTC)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
	[209.85.210.199]) by
	mx-outbound8-225.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 19 Apr 2021 11:48:04 +0000
Received: by mail-pf1-f199.google.com with SMTP id
	f19-20020a056a0022d3b02902608c8a75e0so864053pfj.13
	for <meta-arago@arago-project.org>;
	Mon, 19 Apr 2021 04:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KtNf6KDdiiGcuAQo+2i/yWLVm4K08kuvoHF5VAHJQ8I=;
	b=ElcTTUJq8UpE+w7iJFfEz96Dil5ByeJJItUbrXoFLQS5vhSEh065714o+4qMbOY7Dy
	RfeDbtWEuDsMh0IRJ5EUgJSj8cFy26a4O7NmN/mb64y5nDJUhXYnRTp3rAtuYLGa2yZx
	jQpDFF0HmAmcRzJzxN8I4n4Qcq3huXR9bcQkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KtNf6KDdiiGcuAQo+2i/yWLVm4K08kuvoHF5VAHJQ8I=;
	b=tKb6LycqaAauqXms8HAwqwTd8IIY+n9VTf10rIXGA/ZuGU/pgGU54hOG1DaeFbEJ0x
	+jGuocTkrrNKTEguaQBsV6dbuDurLwF+kAi2T/jMT6rb+K9EeQ/ejN0BSh5buZ+SaTHJ
	YBvWX1V1wcUDnSLTs+Pg+n6G1zJp93cWJ9+C6g0+gV8Re86vbXUwQG7wTaQVQUjstLyw
	+4g1RxhXeYz3dW65ahchX0+kPN5n40vf7NifmvzRIJPGyLKKmh0zh5Unfrl23uKsH4S3
	TwjIRSSMu3lWvofrJHLp76Emfy5ZBv2ehJI43zULXU8QC3OvzMai+0OkIInIAYs55ZOB
	gw2w==
X-Gm-Message-State: AOAM532GXgjQ7n78GeZN7hhGlGQj6x6MqSQvR43rMxVgaBgdX0DFGVke
	K31GSOIbFbliWH2fAhJStkBrGdd9xSuwjWEcXh9zlHDGzCNv1t/CzZljFVjXc6gEBtdJ3pMKEV1
	VKpxMftPC1q/pk2xczOYsglBboOkIV9/Gbsu/tFGaz+CWMDJmZROREZlNlD+J
X-Received: by 2002:a63:d153:: with SMTP id c19mr11429160pgj.311.1618832883650;
	Mon, 19 Apr 2021 04:48:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6EOCIWik9D2pVRU/l+JF6WXhoT2GpXXMW15erRV5hxq8SkajyZWT7EOZ7eKcsHO61F1h05Q==
X-Received: by 2002:a63:d153:: with SMTP id c19mr11429146pgj.311.1618832883495;
	Mon, 19 Apr 2021 04:48:03 -0700 (PDT)
Received: from LAP000568.mistral.in ([223.227.14.13])
	by smtp.gmail.com with ESMTPSA id
	g14sm14767070pjh.28.2021.04.19.04.48.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Apr 2021 04:48:03 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <x0257345@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 19 Apr 2021 17:17:55 +0530
Message-Id: <20210419114755.120000-1-x0257345@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1618832884-302273-5595-127947-1
X-BESS-VER: 2019.1_20210414.2120
X-BESS-Apparent-Source-IP: 209.85.210.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.231661 [from 
	cloudscan17-221.eu-central-1b.ess.aws.cudaops.com]
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
X-List-Received-Date: Mon, 19 Apr 2021 11:47:40 -0000
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


