Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web12.28716.1635144573107878274
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 24 Oct 2021 23:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=Hzj7EqFK;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70]) by mx-outbound16-87.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 25 Oct 2021 06:49:29 +0000
Received: by mail-pj1-f70.google.com with SMTP id nk11-20020a17090b194b00b001a22ed4a912so773911pjb.3
        for <meta-arago@lists.yoctoproject.org>; Sun, 24 Oct 2021 23:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DjebpbuGr6I8zPjkx2nQweaTtJVC6hWyAM7kD5pPqj8=;
        b=Hzj7EqFK9+1ORlE7M+P111VOgc6Vn7T7Mdh5gJfY9oCj5XirsAXMnErf2kd8Xh2cXs
         vdv+7RA7ElqWqAi2+mxsHOThqbGx5IOVZ2A0Mo8Byt3KGq+N72sGJmIlyhdzgsmDk8pQ
         3ErLuuUgzn/39UgA9NsB1UyqF2daP+pBohx9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DjebpbuGr6I8zPjkx2nQweaTtJVC6hWyAM7kD5pPqj8=;
        b=Y54yy3UJhCxWYlLPejdCRmjEZU3xr7IoQ04H65+I8MWwmOHjhuLSQ+EW8Lhra7a4Ik
         2F8dRA0WZznhOKJ26/cCehRH7293wqYpjORaRGT1pi0H51OeYW0wAHRjCd2JckmNlU2e
         wvZ3aRsjYMmr/YiQ90m11UU0NPj4DwrGBWpQ69jvbzQzjK8OPWwHXoj8GAmdxz0dtx0l
         F9+zCkZH2GIScz63RvnpA0z+A3W1wXuMYnKlX6GvKfqqL8d4xPC6l++1czZP+k52/YsF
         AOhaMI2Ye2Yob2Zl/kDU/MY3+q5WnJmJlDMQjd9dYagM0uXJh8njC9538yVIZDdss9HC
         oRIg==
X-Gm-Message-State: AOAM533rrEs8OE3aPxhwzzvvgKLp/Q3Q2KfKKVamPO233iy/qUyEuhFN
	ONfXRF0+M2XLtlvSOtpaF5IL8AvoO7NFpr2ox5EOTFYX69HzsJiD/+3RIrQfYXL6U0PIGO7hT9L
	2mL7fqLkuFRuO3Gv3HWBrCo08+T5Hrn/OoiU2DFU6vqWtRSgN/m1qfOgkmZIvxRM/+s8=
X-Received: by 2002:a05:6a00:1794:b0:47b:e4c8:e4f8 with SMTP id s20-20020a056a00179400b0047be4c8e4f8mr7798540pfg.6.1635144568428;
        Sun, 24 Oct 2021 23:49:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmiyvU60qnLch9OMKS9fNPnGDYUW51kw9xk+kLzT5EPbx2foml5x6RcucNwFQgxImRRfk+UQ==
X-Received: by 2002:a05:6a00:1794:b0:47b:e4c8:e4f8 with SMTP id s20-20020a056a00179400b0047be4c8e4f8mr7798512pfg.6.1635144568067;
        Sun, 24 Oct 2021 23:49:28 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id w13sm20473922pjc.29.2021.10.24.23.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 23:49:27 -0700 (PDT)
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-arago@lists.yoctoproject.org
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denis@denix.org>,
	Minas Hambardzumyan <minas@ti.com>,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][dunfell/master][PATCH] ltp-ddt: Update to latest srcrev for 08.01.00.001
Date: Mon, 25 Oct 2021 12:17:29 +0530
Message-Id: <20211025064729.5479-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-BESS-ID: 1635144569-304183-5363-1437-1
X-BESS-VER: 2019.1_20211021.1606
X-BESS-Apparent-Source-IP: 209.85.216.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.235391 [from 
	cloudscan17-227.eu-central-1b.ess.aws.cudaops.com]
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

 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index bdc23dd9..7a8d1dca 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r2"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "02f6995cd7df25269a3bb3b67736d19bccaac99f"
+SRCREV = "d5b1f2b81b5dedcc12af521cf183803d64e7adbc"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
2.31.1

