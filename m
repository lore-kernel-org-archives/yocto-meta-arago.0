Return-Path: <hnagalla@gmail.com>
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
	[209.85.167.182])
	by arago-project.org (Postfix) with ESMTPS id 9E9B5529E5
	for <meta-arago@arago-project.org>;
	Thu,  5 Dec 2019 19:18:29 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id c16so3820206oic.3
	for <meta-arago@arago-project.org>;
	Thu, 05 Dec 2019 11:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lXCZHsVuc7OHUUBIL/wGf49sufeVtxvnz0QzxHHkMYk=;
	b=Agaz4n31rKZOiaGg85BABcrBc/WrU8RuEkJH1JGZnYkVi82+8KFMoedAQqqBIdNl+d
	Ab3PjRPKrMnUutqUSgwPYykWgm+HQrQ1+RvZYc/LuGguUjboAzX5Svh3HLqEQvqpOH25
	7IpagdITPCwXoxWQ39puCU7aa7j8Ihl8d7kus+Z9Tsuj6zt0pm5nH7L7li2z7ZBPo94V
	HF/Z4jWSpc6hDYb9oEn49J9+otipvIiQscAJDflx9MBgk+UC7RbnJjL0sIbqtIZeZTTo
	r4VYFMP2jrq+A6rrxH48jHYa0aiincq8hrZW7u+iOFbUqPx0boxIeRFOrc4dqwNUqm7K
	65eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lXCZHsVuc7OHUUBIL/wGf49sufeVtxvnz0QzxHHkMYk=;
	b=s1EJX3tvXnP8Y9A/GRGj9eizn20TSOTX7q7vTCSp53gUWG3TqZ2jbaeY0JMGISuoo4
	GRPhBXvFIw96ZAe9xV6Xr2uBq1nJoqrWi/5jeyhlg+1D60exXqya63iQYSvQhuPjyfv9
	x5yB7V+b+71vA+av2fu74vBnxjv607bTAY5kJXia8lfjESudbecFHWeMtjaWFuVlbqfd
	glviR9i1RVg1jc+Q15x32C3JFhPpEVG4CCUrR5vNLcXVyIFky7l1I+cfNyVGCO17s7eJ
	QOu/j9F9Ipvmv7Dwx6xk5TCUQUGy9oL2HxtOGkIkRZ8X2TIqYD17gsTwIFWui0j4uTB9
	f5VQ==
X-Gm-Message-State: APjAAAWVgueYugSRSbCFpHb/MP8YNQB4r6fYPp1ag5lsrXoqH8hwUHkk
	mv0Cs4KFE4N699H7QsLZr3iQGbhxHD4=
X-Google-Smtp-Source: APXvYqwJ4a+JcyMXlv+wzWkzDdQjJeZ1hb6jLXFPsOjl/yWag7OVqyiiG2GgjIURJypkRFIsS/S6qw==
X-Received: by 2002:aca:d883:: with SMTP id p125mr8359107oig.111.1575573416725;
	Thu, 05 Dec 2019 11:16:56 -0800 (PST)
Received: from hari-Latitude-E6430.utdallas.edu
	(cpe-76-184-237-208.tx.res.rr.com. [76.184.237.208])
	by smtp.gmail.com with ESMTPSA id
	t19sm1792758otr.33.2019.12.05.11.16.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 11:16:55 -0800 (PST)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  5 Dec 2019 13:16:35 -0600
Message-Id: <20191205191635.7598-2-hnagalla@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205191635.7598-1-hnagalla@gmail.com>
References: <20191205191635.7598-1-hnagalla@gmail.com>
Subject: [ 1/1] use wireless-regdb-static for > K4.15 kernels
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
X-List-Received-Date: Thu, 05 Dec 2019 19:18:29 -0000

---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 21dc6d0f..24401815 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -14,7 +14,7 @@ WLAN_COMMON = "\
     softap-udhcpd-config \
     eventdump \
     wlconf \
-    wireless-regdb \
+    wireless-regdb-static \
     linux-firmware-iwlwifi-8000c \
     linux-firmware-iwlwifi-8265 \
     linux-firmware-iwlwifi-3160-17 \
@@ -45,7 +45,6 @@ BT_COMMON = "\
 "
 
 BT_TI = "\
-    uim \
     bt-enable \
     bt-fw \
 "
-- 
2.17.1


