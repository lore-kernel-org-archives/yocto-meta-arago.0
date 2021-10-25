Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web08.29081.1635145445774656706
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 00:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=OUiuxYwZ;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70]) by mx-outbound42-207.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 25 Oct 2021 07:03:54 +0000
Received: by mail-pj1-f70.google.com with SMTP id kx11-20020a17090b228b00b001a23c39abfaso1737302pjb.0
        for <meta-arago@lists.yoctoproject.org>; Mon, 25 Oct 2021 00:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHKSdWG9y5rIZgROliVhppH4IYPOXzRNdE7g8Ks1RwA=;
        b=OUiuxYwZUcuEdmNzZx51+D2Z/oac6wAcVjTjvu1k863fl+ohF46iIViGnT0ciGvb61
         Sbj05RF9Eb+KVJzuwRCpGeymJhhLIOw9uXs+FIuU7sYpaaDyiulBRlRrZPwaKhsPUQAs
         UC0JFk6rUc84Lfo4jkENaCY+ALD/RGY+a44HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHKSdWG9y5rIZgROliVhppH4IYPOXzRNdE7g8Ks1RwA=;
        b=2tE1E9B5aPy0fVmSOqulxAIo5b/ICrYd095fyaBFdzNoYQ3iddLGzGkLpFaoaMtlhW
         ewZ7kzvnhtygZGoSWEa8rdncJJ67sa52IQ5d+dd3OXLSjsG6tCbtcrPdG88IJd0wS09K
         vp5NOgppy3PI7dcfabHtU2UOzsx/lAvrII1Q7T8lvguP0jLwe1YN6sAzbA50PLS8BFC7
         fPX880IcwCLsw+jDl5JDWoW7b9UdOOTjD+zcK7uhoj0gM5wM8o04hZheZjk63On2eUoF
         /5l6ZlCua0dhDTxTcR5IoTcfHOatSC+VlkLpCQFDCVVV20gwV1W2ioCiZ+Cmq5Iqn68c
         Xwtw==
X-Gm-Message-State: AOAM531Q+v2G9IHQbKheKDRi4NcgpKvmI/q5gb8kRf3lzWNlC2OtToJ0
	fzHi9lRNN42lxLiSZNllPcevkoeO1qeyoUlbevqm4cHhDG+hjrwzG8AMUW7JJ1fyWUSLnQexhEH
	d7FfXwO3shXOkjPIkUn/v+zBS49uokQftz00KnEtly4NhUhkBXEBPWQmQl+6SnRLCI3I=
X-Received: by 2002:a17:90b:1b11:: with SMTP id nu17mr30800891pjb.129.1635145433044;
        Mon, 25 Oct 2021 00:03:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw/TL8p5gkl7my3tA+wcrGvEqigjdg84Tp59ISFaxhHDaMuCh4BeSguO6h78Qy02yEytHJEA==
X-Received: by 2002:a17:90b:1b11:: with SMTP id nu17mr30800857pjb.129.1635145432705;
        Mon, 25 Oct 2021 00:03:52 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id i2sm21618474pjt.19.2021.10.25.00.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 00:03:52 -0700 (PDT)
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-arago@lists.yoctoproject.org
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denis@denix.org>,
	Minas Hambardzumyan <minas@ti.com>,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][dunfell/master][PATCH V2] ltp-ddt: Update to latest srcrev for 08.01.00.001
Date: Mon, 25 Oct 2021 12:33:46 +0530
Message-Id: <20211025070346.5934-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-BESS-ID: 1635145433-310959-5351-1909-1
X-BESS-VER: 2019.1_20211021.1606
X-BESS-Apparent-Source-IP: 209.85.216.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.235392 [from 
	cloudscan9-1.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <sinthu.raja@ti.com>

Update the ltp-ddt to latest for 08.01.00.001

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Hi All,
Bumping the commit ID to the latest. This is required for J7 SK validation
through Core SDK.

Changes in V2:
Incremented PR value which was missed in the previous version.

V1: https://lists.yoctoproject.org/g/meta-arago/message/13354

 .../recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index bdc23dd9..0b23dbf5 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -11,10 +11,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r2"
+PR = "r3"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "02f6995cd7df25269a3bb3b67736d19bccaac99f"
+SRCREV = "d5b1f2b81b5dedcc12af521cf183803d64e7adbc"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
2.31.1

