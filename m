Return-Path: <hnagalla@gmail.com>
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
	[209.85.210.47])
	by arago-project.org (Postfix) with ESMTPS id 98909529C2
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2019 15:02:24 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id w24so6414475otk.6
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2019 07:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=h/X8q+ouc5alOSnGJNi+qrJPuBaTaMjVEfRaCpmY1B4=;
	b=BGbjS9G6YBj1scHkVwPHv+uEORcQ5DYPVUgHURHfx1MloMQ0MHkRKX3+jddGbBLYVK
	UhDa24XnlRbHG0Six/xN2jTPgKiutLrYtMycNHKxMcdgNjQKOLuXzenXH+97rxdYBN/5
	3R+UnsQ3BF27UMCPeGbuKgwTHwvXei6bjnpf6mcn3jHy4wK+cXP5rQbcXtJCbhN6RY1D
	6BKDrTEfdKy5yRNTU67whqidEVi7GSmDqBZKQERVZHpnx9PtW9n3BD/cwc3lD8fUIjWX
	JBAENy7Au/ZN0o4gRaIk2Vspy5F6e7fmNVy3iBKC2k4qNViefqGvs+Drv+edKRo7YgAk
	QWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h/X8q+ouc5alOSnGJNi+qrJPuBaTaMjVEfRaCpmY1B4=;
	b=CXx3H/4wnkE/RPW4TyOXCW5P9RX29QKzOfB3vx9hLaFLDTZ44uQiPV7W+y3xAFh9Tt
	kFNCpEqXGql2l4FPpC2fA5fPrxv1B5CiJx0wlXs5999CkhFMc9PwQUv9p1juqTsUvUl9
	A+hXnO/W0eCcNMdnYUSRhSx5w+2JYpSDcD26FtrSUyP7MAbSbp5K9Ko7gSnoOKfBZV8R
	wf+eWte5GqUqFEUn/y3OusMJ+cezijbOPFK8w3Q/oc84DuUQ7Q7c2grq3DFjm2XDcvUP
	PhnWG8SwZYazOrpk/V6M6EVW/2DKeImeRdoTRlLr+FmmrYf1x3WIDBRaNtv9sa8SR94Z
	RxuQ==
X-Gm-Message-State: APjAAAWiSaFghOlWwgWm16FvSC5vkMT7CWuw/XmkLPCkcu6RkrX9QRbD
	oBW6pryxJQ9l2qUb6WyhEoMrQLszG2Y=
X-Google-Smtp-Source: APXvYqxt5u9RJlFp4C8n0SULGO8faIX7sr0ZyuwdQVIlb5xMD0TUiELil45wGzbpDeBnbxao1UfcWw==
X-Received: by 2002:a9d:70d0:: with SMTP id w16mr11204475otj.239.1574434856025;
	Fri, 22 Nov 2019 07:00:56 -0800 (PST)
Received: from hari-Latitude-E6430.utdallas.edu
	(cpe-76-184-237-208.tx.res.rr.com. [76.184.237.208])
	by smtp.gmail.com with ESMTPSA id
	o203sm2109024oia.4.2019.11.22.07.00.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 22 Nov 2019 07:00:54 -0800 (PST)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 22 Nov 2019 09:00:28 -0600
Message-Id: <20191122150031.2588-1-hnagalla@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [ 0/3] *** wl18xx wpa-supplicant patches ***
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
X-List-Received-Date: Fri, 22 Nov 2019 15:02:25 -0000

*** BLURB HERE ***

Hari Nagalla (3):
  Add MESH support
  Fix openssl1.1 build errors
  migrate to openssl1.1

 .../wpa-supplicant/wpa-supplicant.inc         |   3 +-
 .../wpa-supplicant/crypto_openssl.patch       | 127 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant/defconfig   |   5 +
 3 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/crypto_openssl.patch

-- 
2.17.1


