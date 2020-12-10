Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 6962C52A1E
	for <meta-arago@arago-project.org>;
	Thu, 10 Dec 2020 19:08:28 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAJ8Mmx060250;
	Thu, 10 Dec 2020 13:08:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607627302;
	bh=jrL3uhV8UfMBCEG0U68tGpmZRyCcJcVnoWRb+3Ns9dE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=lvyh6QSZa27203mXqUlaQ089jwQXr9ONdwmxeEKilktA8T0gSsmQZJUu97LCwyUfD
	8TvAWuXQfZ30itnZFRBsZj2mfrsAIVQtAfOZxSog7lU2BCWHmh8lR2h73aCN4XAg3U
	v8kBHqhD6mUonSI2TzZmLzOqow67dapenE+ESg7s=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAJ8MdR085957
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Dec 2020 13:08:22 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 10 Dec 2020 13:08:21 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 10 Dec 2020 13:08:21 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAJ8KEM128913;
	Thu, 10 Dec 2020 13:08:20 -0600
To: Denys Dmytriyenko <denis@denix.org>
References: <20201209191713.22358-1-c-robey@ti.com>
	<CAM9ZRVu+CME5iHWnuAgvNw+1vt6yLpwKjgkxDHaWk4fOpiZfrg@mail.gmail.com>
	<a9f414e8-b430-d09c-325c-763fd058af24@ti.com>
	<20201210190627.GD19155@denix.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <c13d4798-99a5-24ac-8d4d-61f780032a7b@ti.com>
Date: Thu, 10 Dec 2020 13:08:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210190627.GD19155@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, a0232989 <a0232989@ti.com>,
	a0132237 <a0132237@ti.com>
Subject: Re: [PATCH 1/2] [meta-ti][dunfell/master][PATCH] setup-scripts - removing confusion for users when script succeeds, but does not include correct version in success message
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
X-List-Received-Date: Thu, 10 Dec 2020 19:08:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Denys

On 12/10/20 1:06 PM, Denys Dmytriyenko wrote:
> On Thu, Dec 10, 2020 at 07:10:25AM -0600, Dan Murphy wrote:
>> Paul
>>
>> On 12/10/20 7:06 AM, Paul Barker wrote:
>>> On Thu, 10 Dec 2020 at 12:42, Caleb Robey <c-robey@ti.com> wrote:
>>>> From: a0232989 <a0232989@ti.com>
>>>>
>>>> ---
>>>>   setup-host-check.sh | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/setup-host-check.sh b/setup-host-check.sh
>>>> index 45b4c71..a9db056 100644
>>>> --- a/setup-host-check.sh
>>>> +++ b/setup-host-check.sh
>>>> @@ -43,6 +43,6 @@ if [ "$host" != "precise" -a "$host" != "trusty" -a "$host" != "xenial"  -a "$ho
>>>>       echo "Unsupported host machine, only Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, Ubuntu 16.04 LTS, and Ubuntu 18.04 LTS are supported"
>>>>       exit 1
>>>>   fi
>>>> -echo "Ubuntu 12.04 LTS, Ubuntu 14.04, or Ubuntu 14.04 LTS is being used, continuing.."
>>>> +echo "Ubuntu 12.04 LTS, Ubuntu 14.04, LTS Ubuntu 16.04 LTS, or Ubuntu 18.04 LTS is being used, continuing.."
>>>>   echo "--------------------------------------------------------------------------------"
>>>>   echo
>>>> --
>>>> 2.17.1
>>> I don't see the file "setup-host-check.sh" in meta-ti or meta-arago.
>>> The list of Ubuntu versions there looks very out of date as well.
>>>
>>> Are you sure this patch is being sent to the right place?
>> I asked Caleb to send it to this list.  But he forgot to add the
>> target repo.
>>
>> These scripts are part of this repo
>>
>> http://arago-project.org/git/projects/?p=tisdk-setup-scripts.git;a=summary
> The patch should not have [meta-ti] nor [dunfell/master] tags in the subject.
> Instead, it should have [tisdk-setup-scripts] tag to avoid confusion.
>
Yeah these are Caleb's first patches so he is learning. He originally 
sent them to meta-ti.

Caleb

$subject should be

[tisdk-setup-scripts] [PATCH 1/2] setup-scripts - removing confusion for users when script succeeds, but does not include correct version in success message

Dan


