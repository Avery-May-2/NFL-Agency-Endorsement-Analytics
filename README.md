# NFL Agency Endorsement Analytics  
End-to-end SQL project analyzing NFL endorsement deals, brand performance metrics, and player marketability scoring.

## Overview 
Sports agencies analyze their deal portfolios and performance to understand which partnerships generate the most value and align with their clients’ brands. This helps them make more informed decisions when negotiating future deals and allocating resources. By evaluating performance, agencies can also identify gaps and adjust strategies to stay competitive in a constantly evolving market.

### Tools Used
* SQL \- DB Browser for SQLite  
* Data \- Kaggle NFL datasets \+ synthetic endorsement data  
* Visualization \- Tableau  
* Data Preparation \- Microsoft Excel

### Database Structure  
The database includes four main tables that capture different parts of an agency’s portfolio. The players table stores information about each athlete, while the brands table contains details on the companies involved in endorsements. These two are connected through the endorsement\_deals table, which acts as a bridge by linking each player to a specific brand and recording deal details like value and type. The deal\_performance table then connects to endorsement\_deals, adding outcome metrics such as revenue lift to evaluate how each deal performs after it is signed.

### Business Questions Answered
1. Which players generate the highest total endorsement revenue across all deals?

2. Which brands invest the most in athlete partnerships and how are those investments distributed?

3. What types of endorsement deals produce the strongest performance outcomes?

4. How does deal value relate to actual performance metrics such as revenue lift?

5. Which player brand pairings result in the most successful partnerships?

6. Are certain industries consistently achieving better returns from endorsement deals?

7. How does an individual player’s portfolio perform across multiple deals?

8. Which deals are underperforming relative to their cost?

9. What trends exist over time in deal value and performance?

10. How can agencies optimize future deal negotiations based on past performance data?

### Recommendations
1. The agency should shift its deal strategy toward higher-value opportunities by prioritizing Auto and Finance partnerships while setting a minimum deal threshold to avoid low-return contracts. This will improve overall portfolio efficiency and ensure agent time is spent on the most impactful deals.

2. There is a clear need to renegotiate and maximize value from Elite-tier players, who are currently underperforming relative to their market status. At the same time, the agency should invest in developing RBs, WRs, and defensive players to expand its pool of high-earning clients and reduce overreliance on quarterbacks.

3. To reduce concentration risk, the agency should actively diversify into underrepresented industries such as Tech, Beverage, and Lifestyle. Expanding into these areas will create new revenue streams and protect the portfolio from downturns in Finance or Auto spending.

4. The agency should prioritize converting more deals into Ambassador structures, as they consistently deliver stronger performance across revenue lift, engagement, and recall. Strengthening activation strategies, especially for Equity deals, will ensure brands fully utilize player partnerships and drive better results.

5. Finally, the agency should conduct a deeper review of year-over-year performance dips and player-brand mismatches to refine its strategy. Understanding past declines and improving how players are matched with brands will help sustain long-term growth and unlock untapped value across the portfolio.

**[Key Insights](KEY_INSIGHTS.md)**

**Dashboard: [NFL Agency Endorsement Analytics Dashboard](https://public.tableau.com/views/NFLSportAgencyEndorsementAnalytics/NFLAgencyEndorsementAnalytics?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

**Project Status:** Done

