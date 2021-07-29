Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip33a.ess.de.barracuda.com
	(egress-ip33a.ess.de.barracuda.com [18.185.115.192])
	by arago-project.org (Postfix) with ESMTPS id 8D19552AAE
	for <meta-arago@arago-project.org>;
	Thu, 29 Jul 2021 12:50:15 +0000 (UTC)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
	[209.85.216.70]) by
	mx-outbound11-201.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 29 Jul 2021 12:50:28 +0000
Received: by mail-pj1-f70.google.com with SMTP id
	fa13-20020a17090af0cdb02901731757d1a2so6223660pjb.4
	for <meta-arago@arago-project.org>;
	Thu, 29 Jul 2021 05:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=A4LUlxNLmdntf74LxU1ZOYLaL3iyBawBEgI59M9zc2A=;
	b=nc3nrfyq3zgbYe1EIcQ1v2qTfXS4RQmqjpzMMBQ4cO+AQgQ7w6MvSujjSjckJcy/h6
	7U6dCR1VbmvG946n9eChV2PvVXcR6EjGmJTFiDsghNZxFPJoM/j6OfXuB+zwdiLU6aks
	DWntAuuov/rzfmudu8oNvtIB5NaleaTnLciGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=A4LUlxNLmdntf74LxU1ZOYLaL3iyBawBEgI59M9zc2A=;
	b=OjRDiVf/uLv8lrsqBOXpY/teL0oONhMkt34kDdNabq6spjsGRtzRlR/QCWY00qFx9E
	WDJpjJNBIhFeYVt3jsvVVvTV7JQtHykKOpTyHaUHj99YGD+KiZbFlgQAMpzhMNO8DkTW
	82obTYdfHPYzzMOulC/AccQOSyVgnUknu2T5CpZBUOeRk33PGQZmjlF6zIq5q/A+16eV
	MRKi+GrboZYmkqVgzTQzIU/2QENb2bE8MJFnC/kxgB+jpdh3YKO5KahP27dNTgvzJ1LE
	+knbwuMqlDOE8+lc6nEIrCYRCARweXMR8g6PbTGEvQEkAGG5UQyk2RkHsi7uyVC+sxe7
	vpEw==
X-Gm-Message-State: AOAM533QsFM5f1xkU9Mq4KGcy2DbiRJwzfGYUcUfCYkDe3KZESRkiVYc
	iuz+SU06ObS54oEfhWAuf1iumg0qBe/7YAfLqw4/wowAZ4lqk4umLUvXjqVhB+VAgJRJewo2KX2
	mCLJ/cDSKAkiZfB7t3do/Bfmd/2XTzwN9K4HIrUicLf1CmJDWHOtCd+MY4nlz
X-Received: by 2002:a63:ef4c:: with SMTP id c12mr3714733pgk.441.1627563026786; 
	Thu, 29 Jul 2021 05:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIXnY8LD1+EOvkQDO7UnXtt3kuM18r/ARbf4yDVxuDd4EGit/H1QZCldeaCBzS0C2PLCxa3Q==
X-Received: by 2002:a63:ef4c:: with SMTP id c12mr3714720pgk.441.1627563026557; 
	Thu, 29 Jul 2021 05:50:26 -0700 (PDT)
Received: from LAP000507.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id
	f3sm3705863pfe.123.2021.07.29.05.50.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jul 2021 05:50:26 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 29 Jul 2021 18:20:10 +0530
Message-Id: <20210729125011.9120-4-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20210729125011.9120-1-priya.ns@ti.com>
References: <20210729125011.9120-1-priya.ns@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1627563027-303017-5532-72534-1
X-BESS-VER: 2019.1_20210719.2036
X-BESS-Apparent-Source-IP: 209.85.216.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233794 [from 
	cloudscan9-243.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [tisdk-setup-scripts] [master] [PATCH-V4 3/4] create-sdcard.sh: Stop using cylinder as unit for partition size
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
X-List-Received-Date: Thu, 29 Jul 2021 12:50:16 -0000
Content-Transfer-Encoding: 8bit

* Cylinder size of sdcard is manufacturer dependent. To standardize
  sdcard partitioning remove the use of cylinder (cyl) unit.
* While at it shift to using fdisk for the partitioning the sdcard.
  fdisk is already used in the script and this reduces the dependencies
  of this script on available installed applications.
* This fixes cases where already partitioned cards were being detected
  as not partitioned because of size check elsewhere in the script
  failing.

Signed-off-by: Priya N S <priya.ns@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 create-sdcard.sh | 50 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index d052312..546588b 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -501,11 +501,29 @@ SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
 
 echo DISK SIZE - $SIZE bytes
 
-parted -s $DRIVE mklabel msdos
-parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9
-parted -s $DRIVE set 1 boot on
-parted -s $DRIVE unit cyl mkpart primary ext2 -- 9 310
-parted -s $DRIVE unit cyl mkpart primary ext2 -- 310 -2
+cat << END | fdisk $DRIVE
+n
+p
+1
+
++75M
+n
+p
+2
+
++2.4G
+n
+p
+3
+
+
+t
+1
+c
+a
+1
+w
+END
 
 
 cat << EOM
@@ -559,10 +577,24 @@ SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
 
 echo DISK SIZE - $SIZE bytes
 
-parted -s $DRIVE mklabel msdos
-parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9
-parted -s $DRIVE set 1 boot on
-parted -s $DRIVE unit cyl mkpart primary ext2 -- 9 -2
+cat << END | fdisk $DRIVE
+n
+p
+1
+
++75M
+n
+p
+2
+
+
+t
+1
+c
+a
+1
+w
+END
 
 cat << EOM
 
-- 
2.19.1.windows.1


