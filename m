Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip33a.ess.de.barracuda.com
	(egress-ip33a.ess.de.barracuda.com [18.185.115.192])
	by arago-project.org (Postfix) with ESMTPS id 4372452A71
	for <meta-arago@arago-project.org>;
	Thu, 29 Jul 2021 12:50:10 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
	[209.85.214.199]) by
	mx-outbound11-201.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 29 Jul 2021 12:50:22 +0000
Received: by mail-pl1-f199.google.com with SMTP id
	g12-20020a1709026b4cb029012c0d2e483cso4913353plt.5
	for <meta-arago@arago-project.org>;
	Thu, 29 Jul 2021 05:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=33gxXNSiTC2OhM5NveqxJIMsIPqWxadX/Y0GFiUlp50=;
	b=YzjWgIHGRXROBwGIrDAcMTk1Vtv5OZj+I+QCxaCmP4W4uHm2BQltrUGsR+nFlVLxTp
	fBjXC4ClrIhW083KjjK68jBucbhyXkqVzCpZz0fQzB1Gk0YaoRqpsdMBEDoG4mOFO7K0
	x+jN5ffGUrbNjJIHPmX+fc4ZRG14OsHTBc2GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=33gxXNSiTC2OhM5NveqxJIMsIPqWxadX/Y0GFiUlp50=;
	b=qPr38NG8VGkktvH9tiGWwpbjy0hocqxIYsAIheVfh18h+yHqgEPyRzPNzLacTG1naK
	yBPk5p3zT42DT7c0H/5+YmyMVFpl+CwLcjrCbyqztYl+ZTopvU5jgu6nStNna/0GmHqW
	+cLSpRaGEM4c3hWIk5poHIhsskyU29uTL8nr8ky9KH7dPus+5UXuJNdkm55ERVdDrWIJ
	QnACD4m/2zXwdprH+a6h8XkRkqxO1vU3JrragtZOSs2rOtJplTBCFKuZFQg70LYas/hE
	2TdtH0ZIEqX0B6e+/uDYhK1PrsI+9uM3gyGTEnhezzYw6jq0H8Bu6TlqB8yqJaRvDi4O
	mInA==
X-Gm-Message-State: AOAM531hTwVdpWaZcY3Gu1IZGMdOGjvk01BOW/iDZJp2paIXh71UrgpP
	VxBEyUU03SVOZo/SWVnzybMftk9vNnk+h9m/nrfEAKjSJY2zY3QyspZtvl54jaPXGCagG2hAM09
	7fe4Uugy5jtWeK33uC2pFfQJ/CEwzeJIJHqqDGzRxr2Uw4UHn7tEqSslCaYAL
X-Received: by 2002:a17:902:7c01:b029:12c:323d:9ac with SMTP id
	x1-20020a1709027c01b029012c323d09acmr4562564pll.12.1627563020604;
	Thu, 29 Jul 2021 05:50:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQS1alaEUEuVDkcBRIoaPHQBF1zaEqtTQfHpKMUqj8DB7YZPjihjYUtRi7+UN63KBRhsp2lA==
X-Received: by 2002:a17:902:7c01:b029:12c:323d:9ac with SMTP id
	x1-20020a1709027c01b029012c323d09acmr4562551pll.12.1627563020296;
	Thu, 29 Jul 2021 05:50:20 -0700 (PDT)
Received: from LAP000507.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id
	f3sm3705863pfe.123.2021.07.29.05.50.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jul 2021 05:50:19 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 29 Jul 2021 18:20:07 +0530
Message-Id: <20210729125011.9120-1-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1627563021-303017-5533-72526-1
X-BESS-VER: 2019.1_20210719.2036
X-BESS-Apparent-Source-IP: 209.85.214.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233794 [from 
	cloudscan13-183.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [tisdk-setup-scripts] [master] [PATCH-V4 0/4] create-sdcard: Fix rootfs tarball search and selection
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
X-List-Received-Date: Thu, 29 Jul 2021 12:50:11 -0000
Content-Transfer-Encoding: 8bit

Hi All,

This series of patches fix the issues observed in the create-sdcard
script.

Changes in V4:
The patch #4 is new in the series. This patch increases the boot
partition size to 128 MB in order to sync with WIC image boot
partition size.

v3:
http://arago-project.org/pipermail/meta-arago/2021-July/013245.html
v2:
http://arago-project.org/pipermail/meta-arago/2021-June/013218.html
v1:
http://arago-project.org/pipermail/meta-arago/2021-June/013197.html


Priya N S (4):
  create-sdcard.sh: fix regex used for rootfs tarball
  create-sdcard: Fix wrong rootfs tarball selection
  create-sdcard.sh: Stop using cylinder as unit for partition size
  create-sdcard: Increase boot partition size to 128 MB

 create-sdcard.sh | 76 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 58 insertions(+), 18 deletions(-)

-- 
2.19.1.windows.1


