Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.80883.1638296034531822739
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 10:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pathpartnertech.com header.s=google header.b=LOufu5oV;
 spf=pass (domain: pathpartnertech.com, ip: 209.85.221.53, mailfrom: sidraya.bj@pathpartnertech.com)
Received: by mail-wr1-f53.google.com with SMTP id q3so23502344wru.5
        for <meta-arago@lists.yoctoproject.org>; Tue, 30 Nov 2021 10:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id;
        bh=zdxa4DTKJjS+FnTkR5lVMw/YlIL5XV1Ci19Xwe/woeQ=;
        b=LOufu5oViTu73ODWiZE6QY9a0ADh8VEdpSLUvbwAc7AD6c/Hgo/lcCn3MAYKTrQ/3Y
         1JToruxqpyG54xREeWnSAH/ran9Fw6vaQ9JLiAvE8QtxhUAxSe200NKU1M51vZN27vGd
         4Us56cFQhCMBDwqVwXhWnC0uW4Yzp0x2f5acQMBTnNIGfQSw/cVyxXzaWjC5XnWhOmGN
         TxguaANliwu3QDLGty3dIVir0pw3b1x6QWSRu2yMkVUM9mZfAvu7n53O+cPDHAqiW1Bp
         bcJUj9RXMGCCpEgMhIHfNpWg8eAQ2hG99d4U6xRGsZXdPOSujRd40qLi9HKFZw5nwGlA
         pEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zdxa4DTKJjS+FnTkR5lVMw/YlIL5XV1Ci19Xwe/woeQ=;
        b=JoIGx1AyBmJhW4reYt7BMIeZxh2B+ltWXXco5DnhJCw+aOsUwLWC//mg/oNVmbPZtH
         KR9rvAuaefWLuhDR/VtD3PWdpBe7tNzLfsdDb1j+lT5Opknc51ae94h4KoOFbvQtnt3W
         wRVZ7jEuN3UUEdkLwSMnTbqcgTtX6sAxA6Ry9eyCCSzmtb0+KSq4zZ3hCNfPIxJu94bF
         PkLlEVq1VpsIt1/Pk/eoiUo45MsPBNVDSh6UkeY4dqzTzwNftf7QZK445kI9l6xCm/e+
         4Nt2OnQPl16WNeZf92C9SIAm2Tu3HXh8vsTjlRDxtaYu9bwRbu+Wc6GTYpY73Csju8Im
         qPOQ==
MIME-Version: 1.0
X-Gm-Message-State: AOAM531JT0C2Joi54Pcftbu1lUMH3pIwNSFICGNOmsyMW//kczD6ZQUH
	HK51aFlGjFEmLs+rqnf8YEUgG2o/I3TkKzqu5YoQypjTK9i+eIdQG78zhLRse5iAw5OX+FdxApk
	KaObFZBaj9iQXaSRfpcOK98kU7GsN0lEx
X-Google-Smtp-Source: ABdhPJyAcnD8pGL5xeplSSQiabBHCGQr1MKxf+HCdkl87ggGUVP0M0SJUhddTjrZdlTcfYN89SQWAA==
X-Received: by 2002:a5d:58ed:: with SMTP id f13mr559442wrd.373.1638296032683;
        Tue, 30 Nov 2021 10:13:52 -0800 (PST)
Return-Path: <sidraya.bj@pathpartnertech.com>
Received: from sidraya-laptopU.ent.ti.com ([2401:4900:2502:ea12:860:6195:a98f:fb6e])
        by smtp.gmail.com with ESMTPSA id g13sm23238504wrd.57.2021.11.30.10.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 10:13:52 -0800 (PST)
From: "Sidraya Jayagond" <sidraya.bj@pathpartnertech.com>
To: meta-arago@lists.yoctoproject.org
Cc: yogeshs@ti.com,
	praneeth@ti.com,
	d-huang@ti.com,
	prashanth.ka@pathpartnertech.com,
	praveen.ap@pathpartnertech.com,
	denis@denix.org,
	Sidraya <sidraya.bj@pathpartnertech.com>,
	Angela Stegmaier <angelabaker@ti.com>
Subject: [dunfell/master][PATCH] ti-test: Add viddec-test-app for j7-evm
Date: Tue, 30 Nov 2021 23:43:27 +0530
Message-Id: <20211130181327.3178-1-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="US-ASCII"

From: Sidraya <sidraya.bj@pathpartnertech.com>

The viddec-test-app provides the video decoder test app
(tidec_decode) for j7-evm.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 219b43b6..7b2bda5e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -83,6 +83,7 @@ ARAGO_TI_TEST_append_k3 = " \
 
 ARAGO_TI_TEST_append_j7 = " \
     ufs-utils \
+    viddec-test-app \
 "
 
 ARAGO_TI_TEST_append_omapl138 = " \
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
