Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 68E3352993
	for <meta-arago@arago-project.org>;
	Fri, 10 May 2019 19:17:53 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4AJHO7e082600
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 14:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557515844;
	bh=J1Z3iNwHGuAGiEdbSICx/YGbLtUexFAKlNDhSEKyvoY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ucasEVX+IGmfoP7QPZlkNuNb61+YFAftMnlIHiN6xu4RHht8KAsJyes12APo8N95b
	FbGNymmEwHcxHpeoCQdQLbEScNhvVRAjtTj5WDZEdaNglMmI1czEiG95j/NvCN40dR
	vuA8S2l7vwwFI9IiPJnm2WMsKPLNhi8yFu9YsosQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4AJHOf9031699
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 14:17:24 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 10 May 2019 14:17:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 10 May 2019 14:17:23 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4AJHNG3075326;
	Fri, 10 May 2019 14:17:23 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190510130839.31906-1-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <4f0a7575-c9cb-a52b-15ac-785a0ad32be0@ti.com>
Date: Fri, 10 May 2019 15:17:24 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510130839.31906-1-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [qt-opencv-opencl-opengl-multithreaded][PATCH] Fix demo compilation issue
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
X-List-Received-Date: Fri, 10 May 2019 19:17:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thank you. I have pushed this patch.

- Jake

On 5/10/2019 9:08 AM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   ImageProcessingSettingsDialog.cpp | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/ImageProcessingSettingsDialog.cpp b/ImageProcessingSettingsDialog.cpp
> index fa968af..33e65c1 100644
> --- a/ImageProcessingSettingsDialog.cpp
> +++ b/ImageProcessingSettingsDialog.cpp
> @@ -34,6 +34,7 @@
>   #include "ui_ImageProcessingSettingsDialog.h"
>   // Qt
>   #include <QMessageBox>
> +#include <QRegExpValidator>
>   
>   ImageProcessingSettingsDialog::ImageProcessingSettingsDialog(QWidget *parent) :
>       QDialog(parent),

