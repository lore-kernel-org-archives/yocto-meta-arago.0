Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id CD74252970
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2020 18:52:25 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08HInUVO085337
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2020 13:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1600368570;
	bh=QDcTuGKskftxsLuqh3KVQ7t3XuNAmL9Y+2d194gEehI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mEOvhTgbTv+7eTJSYnxnPvUgiROjNQTdJdNlx/vjPJjq5lbYoptxpiXj3jabVXolL
	T9E+JbqoFW1D4r7CxI/8MICJvzQW0Zb7XuZo32chm4q8HqylENni2OY4+4/+tW2sBH
	l/Hk5NtyLuE5z5Aw4A2jhGaMR4GsUxaJCC6o0Ofw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08HInUlu117118
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2020 13:49:30 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 17 Sep 2020 13:49:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 17 Sep 2020 13:49:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HInTG3013581;
	Thu, 17 Sep 2020 13:49:29 -0500
Date: Thu, 17 Sep 2020 14:49:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20200917184929.GG13699@beryl>
References: <20200917184514.964-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200917184514.964-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH] arago-dunfell: Add meta-python2
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
X-List-Received-Date: Thu, 17 Sep 2020 18:52:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK

On Thu, Sep 17, 2020 at 01:45:14PM -0500, Gowtham Tammana wrote:
> qtwebengine has python2 dependency for its build and does not support
> python3.
> 
> https://doc.qt.io/qt-5.14/qtwebengine-platform-notes.html
> 
> Yocto dunfell uses python3 as default, so add meta-python2 layer for
> adding python2 support.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  configs/arago-dunfell-config.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
> index c9428d9..cdbb674 100644
> --- a/configs/arago-dunfell-config.txt
> +++ b/configs/arago-dunfell-config.txt
> @@ -7,6 +7,7 @@ meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,HEAD,layers=meta-a
>  meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
>  meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> +meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
>  meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
>  meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,d13eb333bf96282c840c290c396d797da2e5e619,layers=meta-arm:meta-arm-toolchain
>  oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
> -- 
> 2.28.0
> 

