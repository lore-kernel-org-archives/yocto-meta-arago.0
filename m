Return-Path: <dmurphy@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2981352A1F
	for <meta-arago@arago-project.org>;
	Mon, 24 Apr 2017 19:04:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OJ4jJD016749
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 14:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493060686;
	bh=Bk14KCCSHgfU50ieFqfeVdOr+0Hq3/0vl1lixa4NuYM=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=P7XF+4Reuwo3f1TAEtiNmsm3JAnb6c533vhgrb/MeqCjoSbyI0cjajLncZ5SydVcZ
	Nn4cEmLJTh0felusSgBOgU5AFLllnCVB7lS2tSNiKc7hGtjeU8OMO6U5L5OupMZPmz
	oK5M+LU70TvnbXs/8w5VnCW2hWMMO6inuam9rnmk=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OJ4jOG009143
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 14:04:45 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 14:04:44 -0500
Received: from [172.22.92.18] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OJ4jkh030113;
	Mon, 24 Apr 2017 14:04:45 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20170424161757.9391-1-dmurphy@ti.com>
	<20170424171337.GB24846@edge>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <c8957f46-9794-8e85-e6d5-8b346ae18005@ti.com>
Date: Mon, 24 Apr 2017 14:04:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170424171337.GB24846@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] linaro-optee: Update to v2.4.0 OPTEE release
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
X-List-Received-Date: Mon, 24 Apr 2017 19:04:46 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Denys

Yeah you are correct.

Do we have TI override OPTEE recipes?

Dan

On 04/24/2017 12:13 PM, Denys Dmytriyenko wrote:
> Dan,
> 
> This looks like a patch against Linaro's meta-optee - the right list would be openembedded@lists.linaro.org
> 


-- 
------------------
Dan Murphy

