Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 8657F52092
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2018 17:06:54 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4H6hXm010405
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 11:06:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543943203;
	bh=Sy6qQtTTr4nwyCBTTViZgKmSlynOHjBDow7DOf+J7Lc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yaC+xTtw9y0riJgmaKR+o/NToSDdhDrB876/BQaQCoV8ZbjFIiS3cRaswDorYMOIP
	MDVtelVZkuVWGKtAYhLM57bQxbT4Qn17mSXORxJE7GWkHTIPQnFac2dw3gK5enH7Gw
	nlOEwrSYNKLWC0VukI9UPnbsldLjMhkLOjMkLkIw=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4H6hNn051730
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 11:06:43 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 11:06:43 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 4 Dec 2018 11:06:43 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB4H6g8B028777;
	Tue, 4 Dec 2018 11:06:43 -0600
Date: Tue, 4 Dec 2018 12:06:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>
Message-ID: <20181204170642.GI6887@beryl>
References: <20181130223649.17624-1-manisha.agrawal@ti.com>
	<20181130223649.17624-3-manisha.agrawal@ti.com>
MIME-Version: 1.0
In-Reply-To: <20181130223649.17624-3-manisha.agrawal@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko][PATCH v1 3/3] qtbase_% : Add gif to the packageconfig
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
X-List-Received-Date: Tue, 04 Dec 2018 17:06:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK.

PACKAGECONFIG should be set in distro config:
http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/conf/distro/arago.conf;hb=HEAD#l102


On Fri, Nov 30, 2018 at 04:36:49PM -0600, Manisha Agrawal wrote:
> gif file playback is needed by the qtquick based mmwavegesture-hmi demo application.
> 
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> index 571261ed..23fb52f0 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> @@ -4,6 +4,8 @@ GLES_EXTRA_DEPS = "libdrm wayland"
>  
>  PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
>  
> +PACKAGECONFIG += "gif"
> +
>  PR_append = ".arago13"
>  
>  QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
> -- 
> 2.13.0
> 

