Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by arago-project.org (Postfix) with ESMTPS id 60FE0529E5
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2020 08:10:00 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id s13so15269474otd.7
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2020 01:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=kpME/q0naGxmnYDaQNJRo6T0jK1rtpntRf+bfx2Y3i4=;
	b=Hnauwpla9fqMck3SB+7rqkGXLb6hmeyc9ArhnssM1+syAVC338Qh+DUZOXq+G0M79J
	AFHRCZtMih1wu883ry65JJacTIgfAtUHKtjr4rnLN5ROqJXHO8/hfqpsP8r0EyMSeSN2
	Onrcfpmak9RSMcFuh+885bqd8N5U461H7BR2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=kpME/q0naGxmnYDaQNJRo6T0jK1rtpntRf+bfx2Y3i4=;
	b=sEaFP7vlfK9bTHp3uzpGu5GxtWRZpwX9HAG8BGaO22CAYbA/1AqXSvFxsVe6L8ryI0
	R3WdsGEuGYG3Ht0JQjjWv7YXE2lf6+VVXLpTJNMCrQ8mwGEKSXQFQmaMZcNw1aBDS0WI
	6er+WeImkTCsiP9uvuyDuqrjPpaGrG5A85fC5UlLhpqsMHXyzeMUlQOe8w8+xcxfdwcj
	/wBIwqfvG5dDNuljzadKI3vFcmbw/yd3PbfPNCt2sGeKwn6bWCKqLqCHgsNFA3z/bFCs
	xQasuCcJzl1ByIbGp9kvZNAzpe9rJ2AfGUBpba6pue2N1kbvEffC/T2zNbN4zzTxfdpB
	PCdw==
X-Gm-Message-State: AOAM533WSDuwj5NdjbXBu1eUtdLhkNtoJRAUmi2r5n3XICkFsgJ81PwD
	sbQmSO1oRlC4U8b/Zn1UNLkgEzMko3sT5RDFaAJ6j6MkfX8=
X-Google-Smtp-Source: ABdhPJydVAGyM9/uYMn9YEeOUG1ojPXltgHi6g4bix+SNffA1sNbshCFVOvZKMhC++atvJLEivabNj4cCFsIy8OveWI=
X-Received: by 2002:a9d:2f05:: with SMTP id h5mr1518066otb.258.1592294845858; 
	Tue, 16 Jun 2020 01:07:25 -0700 (PDT)
MIME-Version: 1.0
From: Paul Barker <pbarker@konsulko.com>
Date: Tue, 16 Jun 2020 09:07:16 +0100
Message-ID: <CAM9ZRVvGjUgsMb0sJSUoS5_v5fygbAzWy1Qo_Uq-W=rc4gW7UQ@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Should Arago enable both systemd and sysvinit distro features?
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
X-List-Received-Date: Tue, 16 Jun 2020 08:10:00 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm trying to build an image using arago distro and the
tisdk-base-image recipe with systemd-networkd replaced with
NetworkManager. I've got this building fine but at boot time
NetworkManager attempts to start twice - once by the initscript
/etc/init.d/network-manager and once by the systemd service.

The initscript is being installed as sysvinit is present in
DISTRO_FEATURES. Similarly the systemd service is being installed as
systemd is present in DISTRO_FEATURES.

My understanding is that DISTRO_FEATURES should contain either
sysvinit or systemd but not both. Enabling both leads to issues like
this one. Would it be possible to disable the sysvinit distro feature
for Arago when systemd is enabled (i.e. when ARAGO_SYSVINIT=0)? Or
would that cause an issue that I'm missing?

Thanks,

-- 
Paul Barker
Konsulko Group

