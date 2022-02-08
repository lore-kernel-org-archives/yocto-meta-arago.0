Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.9112.1644312407087124483
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 01:26:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=TfEp8ONc;
 spf=pass (domain: baylibre.com, ip: 209.85.221.44, mailfrom: clabbe@baylibre.com)
Received: by mail-wr1-f44.google.com with SMTP id d27so1242717wrc.6
        for <meta-arago@lists.yoctoproject.org>; Tue, 08 Feb 2022 01:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7MFebNYGN/cEjYQRdo08gv3IIahyHHRfHLTqb14vBrA=;
        b=TfEp8ONcwRyfDvBHAUu9H48cDsFOuo1BXg/qgh9TC0dsSogPsgoBoinpIjBJPRQPqk
         Sdn+xtfjhWbKhe4AzEJGBWJiWPpK+TAw9YsjFypARPCki026KE9M7zyxF7C2AiwmH8e1
         /LzUxyLw5Y+D1j1s36vSYWIvq+LStqDYs6k6ZDayyluNH+6BYuAsBsCcqeVZMsBecwOH
         H3KDU7QAzFqKFqk7L5cCg17aqGjT0JhdrQ98YCp3+Un6Pmol6ph1qbQyeoCRleS+hCSq
         IS7DqOwLOFkMDn7usn1FO3H/vMbL6T9DMtCfAsYedfdQ5FcTaZ82bc7bxCen+iVqdwAu
         Ghjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7MFebNYGN/cEjYQRdo08gv3IIahyHHRfHLTqb14vBrA=;
        b=ZqYdY6qB8zM22j5NKdrVhOQdbDg4VreVCJZFoqd2xAfIp4WYLcEL6Rf+eKsqWj1QNp
         XrbJFGuuwxdUSPlv4t+lSnnIhAHFgj3hkCXh6M/8F4nZwt3uk7ttHXzJxzb3tIr8qP0Q
         6crkEiiHt0aqpxo9UAMCncMkzJnGh4ba0vfB+OdvJsA5gaJYglPVxpyDyFmYRHK4icS9
         2B1uFpEhf/9nHo0gT5dqyDuFkyTHaxIdHw3SU6Jx/dMuq4gh62itTFpzaAhyqPAt3LFN
         iexGHEWoV663LN7R4Ag7RxjUuCRHnlSIocFdJXhj2QQQ5Ghv016GSol9qijwn3RYp5ke
         KMjA==
X-Gm-Message-State: AOAM5310y/oiw9lTaJT+OpRSJvQFeU90Zmy+HB7AzKp7owMo693ggBgm
	CYeeL0ZjBcAM7Aa+IGXWmOgGCTLNEbZq2g==
X-Google-Smtp-Source: ABdhPJyWro9QW2J/yWjs94kiiQeIxZ8R/UQsCutHs7wT7cv6QUk97NJ+dv7zGcckS/mbFlAX/xHimg==
X-Received: by 2002:a5d:6d03:: with SMTP id e3mr1587083wrq.110.1644312405136;
        Tue, 08 Feb 2022 01:26:45 -0800 (PST)
Return-Path: <clabbe@baylibre.com>
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r17sm1747234wmq.33.2022.02.08.01.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 01:26:44 -0800 (PST)
From: "Corentin Labbe" <clabbe@baylibre.com>
To: meta-arago@lists.yoctoproject.org
Cc: khilman@baylibre.com,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [EXTERNAL,dunfell PATCH v3] matrix-gui-crypto-demos: Use crypto_apps_script instead of crypto_apps_program
Date: Tue,  8 Feb 2022 09:26:35 +0000
Message-Id: <20220208092635.350297-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Corentin Labbe <clabbe@baylibre.com>

In the current situation all crypto tests (like openssl_aes256_encdec.sh) are not copied in final images.
There were present in both crypto_apps_program and crypto_apps_script.
But crypto_apps_program depended on ti-crypto-examples which is disabled since 2 years now.
So let's fallback to original crypto_apps_script.

Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
---
Change since v1:
- Removed private ticket number
Change since v2:
- added more precise subject
- added more precise commitlog

 .../recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb   | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 7029df53..8afd79c7 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -7,17 +7,8 @@ PR = "${INC_PR}.12"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/cryptos_apps_scripts"
-S_ti33x = "${WORKDIR}/git/cryptos_apps_program"
-S_ti43x = "${WORKDIR}/git/cryptos_apps_program"
-S_dra7xx = "${WORKDIR}/git/cryptos_apps_program"
-S_keystone = "${WORKDIR}/git/cryptos_apps_program"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
 # Make sure crypto submenu and app images has been installed. Also make sure openssl is available
 RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl matrix-gui-helper-scripts"
-
-#RDEPENDS_${PN}_append_ti33x = " ti-crypto-examples"
-#RDEPENDS_${PN}_append_ti43x = " ti-crypto-examples"
-#RDEPENDS_${PN}_append_dra7xx = " ti-crypto-examples"
-#RDEPENDS_${PN}_append_keystone = " ti-crypto-examples"
-- 
2.25.1

