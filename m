Return-Path: <vivien.didelot@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by arago-project.org (Postfix) with ESMTPS id 1C95C530C9
	for <meta-arago@arago-project.org>;
	Wed,  6 Oct 2021 23:30:40 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id 138so4290584qko.10
	for <meta-arago@arago-project.org>;
	Wed, 06 Oct 2021 16:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=date:message-id:from:to:cc:subject:in-reply-to:references
	:mime-version:content-disposition:content-transfer-encoding;
	bh=+eyNmpwYBfPO4q9uIEi2BKlClunJ5vwrqMLo4VHG9sY=;
	b=WFb0rH/T0Kk3xMm0hdBAJpjDDyAFCbGfV4VXbT5Ak1N1MLLx+YyB36eqmli4ENfwt7
	ZuWrYPfd6ASDhFmjgyCH5Gh8jwC3bz3hpMWZz0g6bNkXVcX40EdTkQNkjqjZxgH+b1hY
	p2YO/zFP/2Bk2sRAjqmXwIIbyPXDwjKi/KCOGT5Z4wfetYdbgAEFJuj3A01F0siZ2Dmz
	cRuLnvenxwfHq13zC80gpIrZxJfJ4hCXH9Ek2SBlak7iaL8ex2Djy/uXYad6QttK/FGR
	ZZ/XMVu0pG7RMgDeXBBYA7Mqu1q3lJoDKteEovk0au0sQ3ksVIlTZMC0EGAms7n9xxxN
	Mz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
	:references:mime-version:content-disposition
	:content-transfer-encoding;
	bh=+eyNmpwYBfPO4q9uIEi2BKlClunJ5vwrqMLo4VHG9sY=;
	b=XF8OWQttdiUd1zliN33mI614QeD92B1/KqBEabfV/h9VvoReOThrq+sIBFkJ2sohDO
	pCbseBRo05K1obHaa2H+bwD63O6OcY2Jsi4NlulvZwsKJls9nwdiN9G+F1B7jJyi0GB8
	iGMEpsBKDEJ+djM6FKulg5pF9pq8EPY+8r5qUrqan2DCxLKtUYWQGlHRU45p2R4svgwE
	fc2EEEyROVIk97X16efXMnTy28qwlAK3logKNLGdZl7BVtBj9aQ4Mqi/LNdpcs8bzeKp
	g35yEsHOuyMgwAd9A7/9G8G1hevygkJsAuOYVkB0h9yhPT1eW2Y3/xlGpptmKgvu/06l
	2+ZA==
X-Gm-Message-State: AOAM533+tNWDzVAJMeaWnWBowT7l/f9uvrlJ4RV1BWlkw9ojDMvOnWu6
	9yN2gwPCWjtZDteG4z66TYLonIMHNrs=
X-Google-Smtp-Source: ABdhPJzG4IDRAX3wPBTo+ZA7juWj9m7kUubnfBgEbrRwPb+jxLmbnAObLrH437D4qMv5o9kmbSwa1Q==
X-Received: by 2002:a37:9e4b:: with SMTP id h72mr753261qke.475.1633563081314; 
	Wed, 06 Oct 2021 16:31:21 -0700 (PDT)
Received: from localhost
	(bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca.
	[70.53.240.121])
	by smtp.gmail.com with ESMTPSA id c6sm1483009qkg.85.2021.10.06.16.31.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Oct 2021 16:31:20 -0700 (PDT)
Date: Wed, 6 Oct 2021 19:31:20 -0400
Message-ID: <20211006193120.GB4085741@t480s.localdomain>
From: Vivien Didelot <vivien.didelot@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
In-Reply-To: <20211006231956.GN1528@denix.org>
References: <20211006205454.4056166-1-vdidelot@pbsc.com>
	<20211006231956.GN1528@denix.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 06 Oct 2021 23:36:21 +0000
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [PATCH] qtwebengine: replace patch with chromium flags
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
X-List-Received-Date: Wed, 06 Oct 2021 23:30:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Denys,

On Wed, 06 Oct 2021 19:19:56 -0400 Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Oct 06, 2021 at 04:54:54PM -0400, Vivien Didelot wrote:
> > Instead of maintaining an inappropriate hack on qtwebengine to disable
> > seccomp filter sandbox, export the corresponding chromium flag in
> > the QTWEBENGINE_CHROMIUM_FLAGS environment variable.
> > 
> > Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
> > ---
> >  .../qt5/qtbase-conf/ti33x/qt_env.sh           |  5 +++
> >  ...-disable-SECCOMP-BPF-Sandbox-at-star.patch | 32 -------------------
> >  .../recipes-qt/qt5/qtwebengine_git.bbappend   |  4 ---
> >  3 files changed, 5 insertions(+), 36 deletions(-)
> >  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
> > 
> > diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> > index 29fa2969..96526393 100644
> > --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> > +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> > @@ -7,3 +7,8 @@ export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
> >  export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
> >  export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
> >  export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
> > +
> > +# SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
> > +# from the pthread implementation. Disable this feature temporarily until
> > +# those issues are resolved.
> > +export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"
> 
> Why is this only done for ti33x platform? What about other platforms?

Good catch! Should I bbappend the qtwebengine recipe instead to deploy
a new qtwebengine_env.sh file containing QTWEBENGINE_CHROMIUM_FLAGS?


Thanks,

	Vivien

