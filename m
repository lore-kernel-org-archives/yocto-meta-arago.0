Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 9953852ABA
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 15:02:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TF21HP030566
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 10:02:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504018921;
	bh=MYL/HrD4HfrNoNJSNXN7lWfdrrWnDkYrhVN8l7H+Xnk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=MVuSZjjFbKFHG6jbEhlWfUFlLg8XyOsLqy4/ZKQpjKrWXZ0cmnZYcFZQn72hMma9o
	R9dCoeJ/9pUJANwW4d9J/SmghRcAQcOBtTfB1tIjhGe0aJbd9B3EF5u/xs1Zc59Eag
	jnz/5pR12bZ/asIcoKjC4J39/Dq+gpYN2ylpH9nE=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TF21iP032612
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 10:02:01 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 10:02:01 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 10:02:01 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TF20Y1002711;
	Tue, 29 Aug 2017 10:02:01 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1504018227-58339-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <cbc74641-ff4f-2212-6858-e57c26137bab@ti.com>
Date: Tue, 29 Aug 2017 11:02:00 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504018227-58339-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [matrix-gui-v2-apps][PATCH v2] qt5_browser & browser_apps: replace webkit-based demo browsers with webengine-based ones
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
X-List-Received-Date: Tue, 29 Aug 2017 15:02:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed.


On 8/29/2017 10:50 AM, Eric Ruei wrote:
> Replace webkit-based demo browser because webkit is obsolete and will be
> removed soon.
>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   .../browser_webengine.desktop}                                      | 6 +++---
>   qt5_apps/qt5_browser/qt5_browser.desktop                            | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
>   rename browser_apps/{browser_webkit/browser_webkit.desktop => browser_webengine/browser_webengine.desktop} (56%)
>
> diff --git a/browser_apps/browser_webkit/browser_webkit.desktop b/browser_apps/browser_webengine/browser_webengine.desktop
> similarity index 56%
> rename from browser_apps/browser_webkit/browser_webkit.desktop
> rename to browser_apps/browser_webengine/browser_webengine.desktop
> index 7140a4b..53b95ca 100644
> --- a/browser_apps/browser_webkit/browser_webkit.desktop
> +++ b/browser_apps/browser_webengine/browser_webengine.desktop
> @@ -1,12 +1,12 @@
>   #!/usr/bin/env xdg-open
>   
>   [Desktop Entry]
> -Name=Webkit Browser
> +Name=WebEngine Browser
>   GenericName=Demo App
>   Icon=/usr/share/matrix-gui-2.0/apps/images/web-icon.png
> -Exec=/usr/share/qt5/examples/webkitwidgets/browser/browser http://www.ti.com
> +Exec=/usr/share/qt5/examples/webenginewidgets/demobrowser/demobrowser http://www.ti.com
>   Type=Application
>   ProgramType=gui
>   Categories=Browser
>   X-MATRIX-Lock=browser
> -Name[en_US]=browser_webkit.desktop
> +Name[en_US]=browser_webengine.desktop
> diff --git a/qt5_apps/qt5_browser/qt5_browser.desktop b/qt5_apps/qt5_browser/qt5_browser.desktop
> index 2f6636f..a5d3953 100644
> --- a/qt5_apps/qt5_browser/qt5_browser.desktop
> +++ b/qt5_apps/qt5_browser/qt5_browser.desktop
> @@ -4,7 +4,7 @@
>   Name=Browser
>   GenericName=Demo App
>   Icon=/usr/share/matrix-gui-2.0/apps/images/web-icon.png
> -Exec=/usr/share/qt5/examples/webkitwidgets/browser/browser http://www.ti.com
> +Exec=/usr/share/qt5/examples/webenginewidgets/demobrowser/demobrowser http://www.ti.com
>   Type=Application
>   ProgramType=gui
>   Categories=Qt5


