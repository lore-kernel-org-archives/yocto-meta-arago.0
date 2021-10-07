Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id EFF6452B43
	for <meta-arago@arago-project.org>;
	Thu,  7 Oct 2021 14:09:31 +0000 (UTC)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
	[209.85.215.199]) by
	mx-outbound46-48.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 07 Oct 2021 14:10:11 +0000
Received: by mail-pg1-f199.google.com with SMTP id
	w185-20020a6362c2000000b0029566b18a88so2642088pgb.15
	for <meta-arago@arago-project.org>;
	Thu, 07 Oct 2021 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x4A5N60KyIYuQOen+K013aTBFqDaJeFV/lcp8bOAlCQ=;
	b=Yr8ykWFtjBxPQiYPLSLCRBy6yiO5x5muUfbwmfpO7l/NS8Ecz0U1e/MhbDzUF1k/gu
	n7S1mGIXgHEhUVf8S7EYjhwf3yXxvltulacYyVDDgUKAOmfS1dYjQeGtVRL8ZTU0dSnC
	Q082+R9ur3T5O6qq47+duNgu9USG1lcRO/7lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x4A5N60KyIYuQOen+K013aTBFqDaJeFV/lcp8bOAlCQ=;
	b=R8RZFO+usc5YStZJPvKVBmUxOoHlrlrCYwDvGT7Rb1mZ0jtOWVhv9E317N9I3fP20U
	rVhdnJ5SdHP6oVuCjiQlPnxyt7Fs4EUM07aXOFBIMPEYuLHjAHb24A3jZ19nD9JN9k05
	g/fnGzEl4r4eSDA0rgmus+dMdLxnj+oDws0fGn5by6LiN4yZBIeSY3aslF0cKMzWowRQ
	KIP7vnj2dOeOhIYLZmlo3dxTBM1Vwf2nBTblgmYZ5TVWfzJepHL0sl2fE7l2OIZwkFin
	6WhcEQDgZzXJUXCZJ0sgmXQQNPWS4mBtPv+gOm1+/Cjgcr8I0fyM+KOKp1Tg2UEg2wQZ
	cbdg==
X-Gm-Message-State: AOAM530BdHWDJCgdkzREvn2AB03aZnF2+q4ye0KsaAQ70T7zSFzgcN2D
	DO8jNTQHkBOd+AJdbVd3PvDXAXwJsmwaltOpcBs7yNJJdeTnvxRXKIVTrGsmoQImNpi5k2wdusY
	spWHHvG6IHNQzzLvOaNQwrMXSX1e8ZHUiy1yYZh993XGRTz9Dj5DUXSW2W5On
X-Received: by 2002:a63:cf10:: with SMTP id j16mr3548246pgg.257.1633615809443; 
	Thu, 07 Oct 2021 07:10:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6+xPoezxurqeOOBKM8+T1wpEmUSvvebTquHCZ0Y0HQMmZY8rL39d3zlbVj7pA9lyNLgLUCQ==
X-Received: by 2002:a63:cf10:: with SMTP id j16mr3548199pgg.257.1633615808874; 
	Thu, 07 Oct 2021 07:10:08 -0700 (PDT)
Received: from LAP568U.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id
	k14sm25123758pga.65.2021.10.07.07.10.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Oct 2021 07:10:08 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  7 Oct 2021 19:39:37 +0530
Message-Id: <20211007140939.19819-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-BESS-ID: 1633615810-311824-5530-17323-1
X-BESS-VER: 2019.1_20211006.2200
X-BESS-Apparent-Source-IP: 209.85.215.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.234990 [from 
	cloudscan12-16.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Sinthu Raja <sinthu.raja@ti.com>
Subject: [dunfell/master][PATCH 0/2] Package intel 9260 WiFi and BT firmware
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
X-List-Received-Date: Thu, 07 Oct 2021 14:09:32 -0000
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <sinthu.raja@ti.com>

Hi,
This patch series adds support to package the intel 9260 linux firmware
into the J7 EVM SDK. The firmware is already available in the linux firmware
repository, so updated the linux-firmware recipe to packaging the firmware.
Currently, the J7 SK platform is using the intel 9260 chipset, so added code to
package it into J7 EVM SDK.

Sinthu Raja (2):
  packagegroups: tisdk-connectivity: package intel-9260 linux firmware
    images
  linux-firmware: Package intel 9260 WiFi and BT firmware

 .../packagegroup-arago-tisdk-connectivity.bb       |  4 +++-
 .../linux-firmware/linux-firmware_%.bbappend       | 14 +++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.31.1


