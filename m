Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 5633952961
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 15:26:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KFQrZr006107
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505921213;
	bh=ME5EJKstcu7pirEFNPL8Flo7C+tcfEKHUEUzkdKqWXQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=h/b95SdNEckWR31angGcQq4KwTUnl2kEpwXZNwLSSSWbCgDPuS51M4xX/ClVuxU/w
	xMkiYTsmQczelAV9lnxUQxak5KeTiVT8sALfTH02JoNZ+4fC7zqSrSLpJbkC1VFfPA
	l7VlWkKaU5Tp7BDtVp6fqC+B6HFviQnuMXB8DGsE=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFQrN9015830
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:26:53 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 10:26:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 10:26:52 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFQqAt014795;
	Wed, 20 Sep 2017 10:26:52 -0500
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <1505860246-5344-1-git-send-email-m-radhakrishnan2@ti.com>
	<f4cfe5c3-6bfe-f887-cbcd-34cd21991400@ti.com>
	<5130E41A1BA9D145BA0F3B18D5CFB0A7437F64E9@DFLE12.ent.ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <da0f1b3c-ee12-199f-b8cd-aacf8421a608@ti.com>
Date: Wed, 20 Sep 2017 11:26:52 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F64E9@DFLE12.ent.ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk PATCH] pruss-lld-rtos: Adding RTOS recipe for pruss-lld
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
X-List-Received-Date: Wed, 20 Sep 2017 15:26:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thank you for clarifying. This has been pushed.


On 9/20/2017 10:32 AM, Radhakrishnan, Mahesh wrote:
> The patch was submitted sometime back and is under review.
> http://patchwork.dal.design.ti.com/patch/33160/
>
>
> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Wednesday, September 20, 2017 10:14 AM
> To: Radhakrishnan, Mahesh; meta-arago@arago-project.org
> Subject: Re: [EXTERNAL] [meta-arago] [meta-processor-sdk PATCH] pruss-lld-rtos: Adding RTOS recipe for pruss-lld
>
> Please submit this to meta-ti.
>
> On 9/19/2017 6:30 PM, Mahesh Radhakrishnan wrote:
>> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
>> ---
>>    recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb | 25 +++++++++++++++++++++++++
>>    1 file changed, 25 insertions(+)
>>    create mode 100644 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
>>
>> diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
>> new file mode 100644
>> index 0000000..499afce
>> --- /dev/null
>> +++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY = "TI RTOS low level driver library for PRUSS"
>> +
>> +inherit ti-pdk
>> +require recipes-bsp/pruss-lld/pruss-lld.inc
>> +require recipes-bsp/pruss-lld/pruss-lld-1.0.0.inc
>> +
>> +
>> +PR = "${INC_PR}.0"
>> +
>> +S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
>> +
>> +DEPENDS_append = " osal-rtos"
>> +DEPENDS_append_ti33x = " starterware-rtos"
>> +DEPENDS_append_ti43x = " starterware-rtos"
>> +
>> +# Build with make instead of XDC
>> +TI_PDK_XDCMAKE = "0"
>> +
>> +export PDK_PRUSS_ROOT_PATH ="${WORKDIR}/build"
>> +export DEST_ROOT="${WORKDIR}/build"
>> +
>> +# HTML doc link params
>> +PDK_COMP_LINK_TEXT = "PRUSS LLD"
>> +
>> +INSANE_SKIP_${PN} = "arch"


