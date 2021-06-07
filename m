Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip33a.ess.de.barracuda.com
	(egress-ip33a.ess.de.barracuda.com [18.185.115.192])
	by arago-project.org (Postfix) with ESMTPS id 12E4F52B6E
	for <meta-arago@arago-project.org>;
	Mon,  7 Jun 2021 10:38:44 +0000 (UTC)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
	[209.85.215.199]) by
	mx-outbound9-57.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 07 Jun 2021 10:39:24 +0000
Received: by mail-pg1-f199.google.com with SMTP id
	k5-20020a63ba050000b029021ab84617c0so7074432pgf.14
	for <meta-arago@arago-project.org>;
	Mon, 07 Jun 2021 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4YTnHyjzVbT7RLjX+CQeyS9BTwnHfM7voc0LHLZdtlY=;
	b=kP5rsPlGZLgxbEmDC4Cd2y/3AFYWFIb4sAWqPqJczdP8pVzj8ge/9rLl7hVRMwRlpa
	7jB9I4YZO/5SBWC1q1IfdVL5CEwCmlZJReBrt57r+LrOmuI6pfCA6oMY8aNQiHTuku0s
	tLguSLQaQYYGtnN5Y7Zt1U9m/+E+ISbrF2LFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4YTnHyjzVbT7RLjX+CQeyS9BTwnHfM7voc0LHLZdtlY=;
	b=ixI9JhfyEdGXliAn92WyYA8Jze4QXq4JMD+wvd3K82k3CalZnNbm9kEjtx+xlLp0Ig
	pD2JEpvEQQaeDq37Auogp/W40EyZ+7Vt9CS79IhPP887yPHbTot7PF10vrrPKLFwX36E
	KPg06ldtz2yNjj9fpeO5/LTZBk4LiqVFy04H6NlEAYMl851y2wZ1Dr8/s9tcPDwaVocZ
	FvxvDXG8LXiesZgVltJC7LudLXOyIm6gJ8OytLA9kI0c6aK7CgIBrHhquK3Eb52ksRJS
	fO+PwGZ/HorQZhMQQSLUKzTBXZcF9QlSQjfMkM8EWP0YOEh1KQ1/PWJM00DeTjXz8kK8
	zq5Q==
X-Gm-Message-State: AOAM532ApncRn06YByVWcBV+3d4jLoNFghkxx363g3lL2V1deDurNkgW
	5VorluVtDr6YeGllQEr8RGsbp3txnE64KXvO9oE0nhtGPjHbXwVDsKwLSefRp3buZKNLTlcz7XQ
	mmmWoG4A1M62jG1ClHSA+oEQa5aGqb9FcGUVNpzVGEt1FOYu6QBtGRJHXrY9k
X-Received: by 2002:a17:90a:b94c:: with SMTP id
	f12mr19611234pjw.32.1623062363591; 
	Mon, 07 Jun 2021 03:39:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9Tyjxq4w+KC1cJJjPuLk3fZ1n4EFpJPumKFzom11IYWr6wgKj+Ls5B16q+yVdK9HG7UzgQA==
X-Received: by 2002:a17:90a:b94c:: with SMTP id
	f12mr19611213pjw.32.1623062363306; 
	Mon, 07 Jun 2021 03:39:23 -0700 (PDT)
Received: from LAP000507.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id l8sm8508706pgq.49.2021.06.07.03.39.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jun 2021 03:39:22 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
To: meta-arago@arago-project.org
Date: Mon,  7 Jun 2021 16:05:36 +0530
Message-Id: <20210607103539.72720-1-priya.ns@mistralsolutions.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1623062364-302361-5420-461-1
X-BESS-VER: 2019.1_20210603.1645
X-BESS-Apparent-Source-IP: 209.85.215.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.232773 [from 
	cloudscan11-64.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: M V Pratap Reddy <pratap@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [master PATCH 0/3] create-sdcard: Fix rootfs tarball search and selection
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
X-List-Received-Date: Mon, 07 Jun 2021 10:38:45 -0000
Content-Transfer-Encoding: 8bit

From: Priya N S <priya.ns@ti.com>

Hi All,
Below are the patches to fix the issues observed in the create-sdcard
script.

Issue:
1. The create-sdcard script uses 'rootfs' as a regex keyword to find
and list the filesystem tarballs which are available in the SDK
package. As in the current SDK packages, the tarball names are in the
following format,
tisdk-<IMAGE_TYPE>-image-<MACHINE>.tar.xz
Which doesn't have the rootfs keyword. This fails to list the tarballs
available in the package and crashes the script execution.
2. The create-sdcard script detects a partitioned SD card as not
partitioned because of the failure of the size check condition in the
script.

Fix:
1. The 'image' is used as the regex keyword to match the tarball names
in the SDK packages.
2. The usage of the cylinder size unit for partitioning the SD card is
removed since the cylinder size is SD card manufacturer dependent.
The parted command is replaced with fdisk since fdisk is an available
installed utility.

Priya N S (3):
  create-sdcard.sh: fix regex used for rootfs tarball
  create-sdcard: Fix wrong rootfs tarball selection
  create-sdcard.sh: Stop using cylinder as unit for partition size

 create-sdcard.sh | 75 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 17 deletions(-)

-- 
2.19.1.windows.1


