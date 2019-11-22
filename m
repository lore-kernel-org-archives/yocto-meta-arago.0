Return-Path: <hnagalla@gmail.com>
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
	[209.85.210.52])
	by arago-project.org (Postfix) with ESMTPS id 436AE529C2
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2019 15:02:26 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 23so4630275otf.2
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2019 07:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MKkt/KM9cvuqhTP3QCab3l7KBUa6843EUDdT887mZuI=;
	b=Hue7CHxCjqb8dKp1AwXTdnRtXa5bKz4wOfi6QNAh7y+9Py0i7q7J3TtUUkyYSBZHk7
	wW0Z9JTrz0y+xunNO5xnRhF0eHyztdp4sbm56MxfotfDeHhRIoyKX3RBKaKaB2qpEsiV
	zTX8CMTEktTBgIKu7Q7sRSmPlYXftLHdy6PZ8RJQ+F41trCtg5ge8dCyVjUSo2qh5mws
	lWwPE3qxnisfTLvtHxqDZPXw1TbjV7936Za5zXymlRG5ripqeyYFbgz3Lc6Stqub+YcS
	um2MYoD4r4j3jOxrGEaI7zMm3v9k3koZFFafKD0Bz4tHI3i84ojUU51Oaly2T8bVkbHE
	t0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MKkt/KM9cvuqhTP3QCab3l7KBUa6843EUDdT887mZuI=;
	b=NmTayodZ4r5qa7AEiIZzP1nWHTSw0ERiaqrW3fe1OO2CTfKRN9BWtsJVv669wH41PE
	O2fBYwL/xx+iVP/TOy3XUwdtntLvVr0NH+v+8YJat0QkdJD/xuu7CfoYqLJGKu1N+t5P
	6NPljKgKgu1GWewO30FaS3GtVrTOJD9F81vyneL6CMpQdjBFP5yIPgTHJjsPksNC4e18
	Ar25bAx9g+xYOl2cKR+hSZyN6TzOv0c5eLB7S+yDXMb5zryiAznIeQdySMlk0slZLQno
	EBbmkko9y81FkcqN0D+odvqzTFH+RF+4kX9vd7GhaeSUM475fjQLO6ReLq+cPxSbcaA6
	e9Mw==
X-Gm-Message-State: APjAAAXI/OT7B+dmQLdWYurZsshlAKY8Jz3ws9wk6XmlnKXMWmD4M0Eu
	nxDrHWb3QivAqkyjqE7hvROfctAD+GY=
X-Google-Smtp-Source: APXvYqyf0dy/9YmO3AFL9HhCVV8+LDcJqw2tphjilE1ebNN1+/fpvbhQnQyomjhWCosRV/+Fae5mPA==
X-Received: by 2002:a05:6830:15d8:: with SMTP id
	j24mr11506146otr.238.1574434857732; 
	Fri, 22 Nov 2019 07:00:57 -0800 (PST)
Received: from hari-Latitude-E6430.utdallas.edu
	(cpe-76-184-237-208.tx.res.rr.com. [76.184.237.208])
	by smtp.gmail.com with ESMTPSA id
	o203sm2109024oia.4.2019.11.22.07.00.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 22 Nov 2019 07:00:56 -0800 (PST)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 22 Nov 2019 09:00:29 -0600
Message-Id: <20191122150031.2588-2-hnagalla@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122150031.2588-1-hnagalla@gmail.com>
References: <20191122150031.2588-1-hnagalla@gmail.com>
Subject: [ 1/3] Add MESH support
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
X-List-Received-Date: Fri, 22 Nov 2019 15:02:27 -0000

---
 .../wpa-supplicant/wpa-supplicant/defconfig                  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
index fcbe06d8..2f25cd39 100755
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -541,3 +541,8 @@ include $(wildcard $(LOCAL_PATH)/android_config_*.inc)
 NEED_BGSCAN=y
 CONFIG_BGSCAN_LEARN=y
 CONFIG_BGSCAN_SIMPLE=y
+
+CONFIG_DRIVER_NL80211_QCA=y
+CONFIG_EAP_AKA_PRIME=y
+CONFIG_MESH=y
+CONFIG_SAE=y
-- 
2.17.1


