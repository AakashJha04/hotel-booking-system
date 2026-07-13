import React from 'react';
import dayjs from 'dayjs';
import Filter from './filter';
import SortFilter from './filter/components/sort-filter';
import Hotels from './hotels';
import PaginationFilter from './filter/components/pagination-filter';
import useQuery from '@/lib/hooks/useQuery';
import API_CONFIG from '@/config/api.config';

const searchParams = {
  city: 'Mumbai',
  startDate: dayjs().add(7, 'day').format('YYYY-MM-DD'),
  endDate: dayjs().add(9, 'day').format('YYYY-MM-DD'),
  roomsCount: 2,
  page: 0,
  size: 2,
};

const SearchPage = () => {
  const { data, isLoading, error } = useQuery({
    url: API_CONFIG.HOTEL.BROWSE_HOTELS,
    options: {
      params: searchParams,
    },
  });
  const hotels = data?.data.content || []
  const totalElements = data?.data.totalElements || 0


  return (
    <div className="container flex gap-4 mt-6 mb-12">
      <Filter />
      <section className="flex-1 space-y-6">
        <div className="flex items-center justify-between">
          <h1 className="text-xl font-bold">
            {searchParams.city}: {totalElements} properties found
          </h1>
          <SortFilter />
        </div>
        <Hotels error={error} isLoading={isLoading} data={hotels} />
        {hotels.length > 0 && <PaginationFilter />}
      </section>
    </div>
  );
};

export default SearchPage;
